$AppID    = '****'
$Secret   = '****'
$TenantID = '****'
$Resource = "https://management.azure.com/"
$TokenUri = "https://login.microsoftonline.com/$TenantID/oauth2/token/"
$Body     = "client_id=$AppId&client_secret=$Secret&resource=$Resource&grant_type=client_credentials"

$TokenResult = Invoke-RestMethod -Uri $TokenUri -Body $Body -Method "POST"
$AccesToken = $TokenResult.access_token
echo $AccesToken
