$currentAzureContext = Get-AzContext
$azureRmProfile = [Microsoft.Azure.Commands.Common.Authentication.Abstractions.AzureRmProfileProvider]::Instance.Profile;
$profileClient = New-Object Microsoft.Azure.Commands.ResourceManager.Common.RMProfileClient($azureRmProfile);
$Accesstoken = $profileClient.AcquireAccessToken($currentAzureContext.Subscription.TenantId).AccessToken;

$token = "Bearer " + $AccessToken

$headers = @{
    Authorization = $token
    "Content-Type" = "application/json"
}


$numofowners = 0
$ownerid = "8e3af657-a8ff-443c-a75c-2fe8c4bcb635"


$subs = get-azsubscription
$sub = $subs[0]


$subid = $sub.Id

$endpoint = "https://management.azure.com/subscriptions/$subId/providers/Microsoft.Authorization/roleAssignments?api-version=2018-01-01-preview"

$output = Invoke-WebRequest -Method Get -Headers $headers -uri $endpoint -UseBasicParsing

$myarray = $output.Content | Convertfrom-Json

# you're going to want to run another for loop here $myarray.value[0]

foreach($role in $myarray.value){
   
    
    $roleid = $role.properties.roleDefinitionId
   
    
    
    
    
    
   if($roleid -eq "/subscriptions/$subid/providers/Microsoft.Authorization/roleDefinitions/$ownerid"){
    $numofowners += 1
   }
    
        
    
}
if($numofowners -gt 2){
    Write-Output "$numofowners is waaayyy  TOoooooo Many Ownersss!"
    
}






