Add-PSSnapin *sharepoint*

$web = Get-SPWeb "http://pddokuclu-test.garaio.ch/arch/archivjobs"
$list = $web.Lists["Business Process"]

Write-Host -ForegroundColor Green "Updating item in list $($list.Title)"

$listItem = $list.GetItemById(1)
$listItem["parlJobStatus"] = "offen"
$listItem["parlJob"] = "provisioning"

$listItem.SystemUpdate()

$archSiteUrl = "http://pddokuclu-test.garaio.ch/arch/2/201/18.Divers"

Write-Host -ForegroundColor Green "Removing site $archSiteUrl"

Remove-SPWeb -Identity $archSiteUrl -Recycle -Confirm:$false