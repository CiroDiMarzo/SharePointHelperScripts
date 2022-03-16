Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.dll"

$siteUrl = "http://pddokuclu-test.garaio.ch/arch/"
$webUrl = "/201/18.Divers"
$spSite = New-Object Microsoft.SharePoint.SPSite($siteUrl)

foreach ($web in $spSite.RootWeb.Webs) {
    Write-Host -ForegroundColor Green "Title: $($web.Title) Url: $($web.Url)"
}


Export-SPWeb -Identity http://pddokuclu-test.garaio.ch/docs/2/201/18.Divers -Path "D:\backup_20220303_01.bak" -Confirm:$false -IncludeUserSecurity:$true -IncludeVersions All -UseSqlSnapshot:$true

Import-SPWeb -Path "D:\backup_20220303_01.bak" -Identity http://pddokuclu-test.garaio.ch/arch/2/201/18.Divers -IncludeUserSecurity:$true IncludeUserCustomAction All