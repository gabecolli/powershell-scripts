$AppID    = '3513f4b6-af10-46e1-a179-6b3e897c24b8'
$Secret   = 'Mmi8Q~4nyH1yH66wSHCSQe2-0kWxvFTnuIU1AbrY'
$TenantID = '8582505d-c91e-40e2-823f-0761a18048a5'
$Resource = "https://management.azure.com/"
$TokenUri = "https://login.microsoftonline.com/$TenantID/oauth2/token/"
$Body     = "client_id=$AppId&client_secret=$Secret&resource=$Resource&grant_type=client_credentials"

$TokenResult = Invoke-RestMethod -Uri $TokenUri -Body $Body -Method "POST"
$AccesToken = $TokenResult.access_token
echo $AccesToken