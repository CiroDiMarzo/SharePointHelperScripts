Add-PSSnapin *sharepoint*

$web = Get-SPWeb "http://pddokuclu-test.garaio.ch/arch/archivjobs"
$list = $web.Lists["Business Process"]
$itemIds = @(16)

foreach ($id in $itemIds) {
    Write-Host -ForegroundColor Green "Updating item with id $id in list $($list.Title)"
    $listItem = $list.GetItemById($id)
    $listItem["parlJobStatus"] = "offen"
    $listItem["parlJob"] = "archiv"
    
    $listItem.SystemUpdate()   
}

$archSiteUrl = "http://pddokuclu-test.garaio.ch/arch/2/201/18.Divers"

RemoveSite -siteUrl $archSiteUrl

function RemoveSite {
    param (
        [string] $siteUrl
    )

    Write-Host -ForegroundColor Green "Removing site $siteUrl"

    Remove-SPWeb -Identity $siteUrl -Recycle -Confirm:$false   
}