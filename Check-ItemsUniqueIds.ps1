Add-PSSnapin *sharepoint*

Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.dll"

function Check-NotExist {
    param (
        [Microsoft.SharePoint.SPList]$list
    )
    $result = $true
    
    Write-Host -ForegroundColor Green "Processing list $($list.Title)."
    
    foreach ($item in $list.Items) {
        $id = $item["parlDocId"]
    
        $file = $web.GetFile($id);
    
        if ($file.Exists) {
            Write-Host -ForegroundColor Yellow "Unexpected, found file with Id $id."
            $result = $false
            break;
        } else {
            Write-Host -ForegroundColor Green "File with id $id does not exist."
        }
    }
}

function Check-Exist {
    param (
        [Microsoft.SharePoint.SPList]$list
    )
    $result = $true
    
    Write-Host -ForegroundColor Green "Processing list $($list.Title)."
    
    foreach ($item in $list.Items) {
        $id = [Guid]($item["parlDocId"])
    
        $file = $web.GetFile($id);
    
        if ($false -eq $file.Exists) {
            Write-Host -ForegroundColor Yellow "Unexpected, file with Id $id NOT found."
            $result = $false
            break;
        } else {
            Write-Host -ForegroundColor Green "The file with id $id exists."
        }
    }
}
$site = New-Object Microsoft.SharePoint.SPSite("http://pddokuclu-test.garaio.ch/arch/2/201/18.Divers/")

$web = $site.OpenWeb()

$list = $web.GetList("$($web.ServerRelativeUrl)/ArchiveCheck")

#Check-NotExist -list $list
Check-Exist -list $list

$decision = Read-Host

Write-Host $decision
