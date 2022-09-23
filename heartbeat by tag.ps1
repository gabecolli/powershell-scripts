$vms = get-azvm

foreach($machine in $vms){
    $WorkspaceID = '*****'

$Query = '

Heartbeat
| where Computer == $machine
| where ResourceType == "virtualMachines"
| extend ResourceGroup = case(ResourceGroup <> "", ResourceGroup, "On-Prem")
| where TimeGenerated > ago(72h) //and Computer in ({Servers})
| extend Resource=tolower(iff(isempty(_ResourceId), Resource, _ResourceId))
| summarize heartbeat_per_hour=count() by bin_at(TimeGenerated, 1h, ago(72h)), Resource,ResourceGroup
| extend available_per_hour=iff(heartbeat_per_hour>0, true, false)
| extend RG = tolower(ResourceGroup)
| summarize total_available_hours=countif(available_per_hour==true) by Resource,RG

'

$Results = Invoke-AzOperationalInsightsQuery -WorkspaceId $WorkspaceID -Query $Query 
#$Results.Results | Export-Csv -Path "C:\Users\gabrielcolli\OneDrive - Microsoft\Desktop\sandbox\logs.csv"
$avail_hours = $Results.Results.total_available_hours  # this is an array
$availabilty_percentage = $avail_hours / 72
echo $availabilty_percentage












}






