$AppID    = '6c7cfd89-c5a5-400a-9e9a-c1125b5e2c42'
$Secret   = 'EBd8Q~iX7EmiIGyOlaNOUCMJ_9j9NYkq6IM1gdzh'
$TenantID = '72f988bf-86f1-41af-91ab-2d7cd011db47'
$Resource = "https://management.azure.com/"
$TokenUri = "https://login.microsoftonline.com/$TenantID/oauth2/token/"
$Body     = "client_id=$AppId&client_secret=$Secret&resource=$Resource&grant_type=client_credentials"

$TokenResult = Invoke-RestMethod -Uri $TokenUri -Body $Body -Method "POST"
$AccesToken = $TokenResult.access_token

$token = "Bearer " + $AccesToken

$headers = @{
    Authorization = $token
    "Content-Type" = "application/json"
}

$body = @"
{
    "properties": {
      "roleDefinitionId": "/providers/Microsoft.Authorization/roleDefinitions/8e3af657-a8ff-443c-a75c-2fe8c4bcb635",
      "principalIds": [
        "2e26dbf0-57a4-4e07-bb1f-6263c697ce11"
      ],
      "dependsOn": ["test1"],
      "displayName": "Gabriel Colli (gabrielcolli@microsoft.com) : Owner"
    },
    "kind": "roleAssignment",
    "id": "/subscriptions/284bc6ed-4e92-4149-aa3d-15d98ce038bf/providers/Microsoft.Blueprint/blueprints/demo-bprint-3-09-2022/artifacts/2e96fd82-6895-44e4-afc3-24d1879c1197",
    "type": "Microsoft.Blueprint/blueprints/artifacts",
    "name": "2e96fd82-6895-44e4-afc3-24d1879c1197"
  }
"@
$json = $body | ConvertTo-Json

$url = "1https://management.azure.com/subscriptions/284bc6ed-4e92-449-aa3d-15d98ce038bf/providers/Microsoft.Blueprint/blueprints/demo-bprint-3-09-2022/artifacts/?api-version=2018-11-01-preview"
$response = Invoke-WebRequest -Method GET -Uri $url -Headers $headers -UseBasicParsing
$response.Content








