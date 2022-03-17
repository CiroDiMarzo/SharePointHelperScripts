Add-PSSnapin *sharepoint*

$web = Get-SPWeb "http://pddokuclu-test.garaio.ch/arch/archivjobs"
$list = $web.Lists["Business Process"]

Write-Host -ForegroundColor Green "Adding item in list $($list.Title)"

$title = "18.Divers"

$listItem = $list.Items.Add()
$listItem["Title"] = $title
$listItem["parlSourceURL"] = "http://pddokuclu-test.garaio.ch/docs/2/201/$title"
$listItem["parlDestURL"] = "http://pddokuclu-test.garaio.ch/arch/2/201/$title"
$listItem["parlJobStatus"] = "offen"
$listItem["parlStatus"] = "Offen"
$listItem["parlJob"] = "provisioning"
$res = New-Object Microsoft.SharePoint.SPFieldUserValue
$res.LookupId = 95
$listItem["parlResponsible"] = $res

$listItem.Update()