
$endpoint = "https://management.azure.com/subscriptions/subid/providers/Microsoft.Authorization/roleAssignments?api-version=2018-01-01-preview"


$currentAzureContext = Get-AzContext
$azureRmProfile = [Microsoft.Azure.Commands.Common.Authentication.Abstractions.AzureRmProfileProvider]::Instance.Profile;
$profileClient = New-Object Microsoft.Azure.Commands.ResourceManager.Common.RMProfileClient($azureRmProfile);
$Accesstoken = $profileClient.AcquireAccessToken($currentAzureContext.Subscription.TenantId).AccessToken;

$token = "Bearer " + $AccessToken

$headers = @{
    Authorization = $token
    "Content-Type" = "application/json"
}


#$output = Invoke-WebRequest -Method Get -Headers $headers -Uri $endpoint -UseBasicParsing




$automation_variable = "https://management.azure.com/subscriptions/subid/resourceGroups/Demo-Automation/providers/Microsoft.Automation/automationAccounts/Automation/variables/owners?api-version=2019-06-01"


$body = '{
  "name": "sampleVariable",
  "properties": {
    "value": 3,
    "description": "my description",
    "isEncrypted": false
  }
}'


$output = Invoke-WebRequest -Method Put -Headers $headers -Body $body -Uri $automation_variable -UseBasicParsing













