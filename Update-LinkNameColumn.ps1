Add-PSSnapin *sharepoint*

Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.dll"

function Update-LinkName {
    param (
        [Microsoft.SharePoint.SPWeb]$web,
        [string]$listUrl,
        [int32]$itemId
    )
    
    $list = $web.GetList("$($web.ServerRelativeUrl)/$listUrl")

    Write-Host -ForegroundColor Green "list title $($list.Title)."

    $item = $list.Items.GetItemById($itemId)

    # foreach ($field in $item.Fields) {
    #     Write-Host -ForegroundColor Green "Field name $($field.StaticName) $($field.InternalName) $($field.TypeDisplayName) ."
    # }

    Write-Host -ForegroundColor Green "Item id $($item.ID)."

    Write-Host -ForegroundColor Green "Item url $($item.Url)."
    
    Write-Host -ForegroundColor Green "Item FileLeafRef $($item["FileLeafRef"])."

    $item["FileLeafRef"] = [System.Guid]::NewGuid();
    $item.SystemUpdate()
    
    Write-Host -ForegroundColor Green "Item FileLeafRef (after) $($item["FileLeafRef"])."
}
$site = New-Object Microsoft.SharePoint.SPSite("http://pddokuclu-test.garaio.ch/arch/2/201/18.Divers/")

$web = $site.OpenWeb()

#Check-NotExist -list $list
Update-LinkName -web $web -itemUniqueId -listUrl "ArchiveCopies" -itemId 172
