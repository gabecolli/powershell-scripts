#creates bearer token
$currentAzureContext = Get-AzContext
$azureRmProfile = [Microsoft.Azure.Commands.Common.Authentication.Abstractions.AzureRmProfileProvider]::Instance.Profile;
$profileClient = New-Object Microsoft.Azure.Commands.ResourceManager.Common.RMProfileClient($azureRmProfile);
$token = $profileClient.AcquireAccessToken($currentAzureContext.Subscription.TenantId).AccessToken;

$uri = "https://management.azure.com/subscriptions/yoursubscription/resourceGroups/Demo-Automation/providers/Microsoft.Automation/automationAccounts/Automation/softwareUpdateConfigurations/test1?api-version=2019-06-01"
$json = @"
{
    "id":"/subscriptions/subid/resourceGroups/Demo-Automation/providers/Microsoft.Automation/automationAccounts/Automation/softwareUpdateConfigurations/test1",
    "name":"test1",
    "type":null,
    "properties" : {
        "updateConfiguration": {
            "azureVirtualMachines" : ["/subscriptions/subid/resourceGroups/Demo-Automation/providers/Microsoft.Compute/virtualMachines/windowsHRW"],

            "duration":"PT2H",
            "Linux" : null,
            "nonAzureComputernames" : null,

            "operatingSystem": "windows",
            "targets" : null,
            "windows" : { 
                "excludedKbNumbers":[],
                "includedKbNumbers":[],
                "includedUpdateClassifications": "Critical, Security, UpdateRollup, FeaturePack, ServicePack, Definition, Tools, Updates",
                "rebootSetting":"IfRequired"}},
        
        "scheduleInfo" : {
            "advancedSchedule" : null,
             "creationTime" : "2022-04-06T21:50:45.2166667+00:00",
             "description" : null,
             "expiryTime" : "2022-04-10T19:43:00-07:00",
             "expiryTimeOffsetMinutes" : -420.0,
             "frequency" : "week",
             "interval" : 1,
             "isenabled" : true,
             "nextRun":"2022-04-07T19:43:00-07:00",
             "nextRunOffsetMinutes":-420.0,
             "startTime":"2022-04-06T19:43:00-07:00",
             "startTimeOffsetMinutes":-420.0,
             "timeZone":"America/Los_Angeles"}
        }               
}
"@
$headers = @{
 Authorization = "Bearer $token"

}
$params = @{
    Uri = $uri
    Headers = $headers
    Method = 'PUT'
    Body = $json
    ContentType = 'application/json'
}

Invoke-RestMethod -Uri $uri -Headers $headers -Method 'PUT' -Body $json -ContentType 'application/json'




