#Add-Type "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.dll"
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint")

$ctTitle = "ArchiveCheck"
for ($i = 2; $i -lt 7; $i++) {
    $site = New-Object Microsoft.SharePoint.SPSite("http://pddokuclu-test.garaio.ch/docs/$i")
    Write-Host -ForegroundColor Green "Reading site collection $($site.Url)"
    foreach ($spWeb in $site.AllWebs) {
        foreach ($ct in $spWeb.ContentTypes) {
            if ($ct.Name -eq $ctTitle) {
                Write-Host -ForegroundColor Red "Web $($spWeb.Title) has the CT $ctTitle"
                $r = Read-Host
            }
        }
        foreach ($innerSpWeb in $spWeb.Webs) {
            foreach ($ct in $spWeb.ContentTypes) {
                if ($ct.Name -eq $ctTitle) {
                    Write-Host -ForegroundColor Red "Inner Web $($innerSpWeb.Title) has the CT $ctTitle"
                    $r = Read-Host
                }
            }
            foreach ($spList in $innerSpWeb.Lists) {
                foreach ($ct in $spList.ContentTypes) {
                    if ($ct.Name -eq $ctTitle) {
                        Write-Host -ForegroundColor Red "List $(spList) in web $($innerSpWeb.Title) has the CT $ctTitle"
                        $r = Read-Host
                    }
                }
            }
        }
    }
}