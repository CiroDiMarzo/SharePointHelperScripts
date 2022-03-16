Add-PSSnapin *sharepoint*

Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.dll"

function Check-Exist {
    param (
        [Microsoft.SharePoint.SPWeb]$web,
        [System.Guid]$itemUniqueId
    )
    
    $spFile = $web.GetFile($itemUniqueId)

    Write-Host -ForegroundColor Green "Item exists $($spFile.Exists)."
    
}
$site = New-Object Microsoft.SharePoint.SPSite("http://pddokuclu-test.garaio.ch/docs/2/201/18.Divers/")

$web = $site.OpenWeb()

#Check-NotExist -list $list
Check-Exist -web $web -itemUniqueId ([System.Guid]::New("03b5f5c4-05d2-416b-84d0-646a42fb45b3"))
