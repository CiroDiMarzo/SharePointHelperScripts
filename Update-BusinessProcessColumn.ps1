Add-PSSnapin *sharepoint*

$web = Get-SPWeb "http://pddokuclu-test.garaio.ch/arch/archivjobs"
$list = $web.Lists["Business Process"]
$itemIds = @(13)

foreach ($id in $itemIds) {
    Write-Host -ForegroundColor Green "Updating item with id $id in list $($list.Title)"
    $listItem = $list.GetItemById($id)
    $listItem["parlJobStatus"] = "offen"
    $listItem["parlJob"] = "provisioning"
    
    $listItem.SystemUpdate()   
}

$archSiteUrl = "http://pddokuclu-test.garaio.ch/arch/2/201/18.Divers"

Write-Host -ForegroundColor Green "Removing site $archSiteUrl"

Remove-SPWeb -Identity $archSiteUrl -Recycle -Confirm:$false