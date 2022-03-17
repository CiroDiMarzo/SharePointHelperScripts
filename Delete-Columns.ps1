param (
    [bool] $deleteColumns = $false
)

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint")

$site = New-Object Microsoft.SharePoint.SPSite("http://pddokuclu-test.garaio.ch/docs/2")

$groupName = "_Parl Columns"

$spWeb = $site.RootWeb

$dossierWeb = $site.OpenWeb("$($spWeb.ServerRelativeUrl)/201/18.Divers")

$listsToDelete = @("ArchiveCheck", "ArchiveCopies")

foreach ($listUrl in $listsToDelete) {
    $list1 = $dossierWeb.GetList("$($dossierWeb.ServerRelativeUrl)/$listUrl")
    if ($null -eq $list1) {
        Write-Host -ForegroundColor Yellow "The list $listUrl does not exist."
    }
    else {
        Write-Host -ForegroundColor Green "Deleting the list $listUrl."
        $list1.AllowDeletion = $true
        $list1.Update()
        $list1.Delete()
    }   
}

if ($true -eq $deleteColumns) {
    $spCt = $spWeb.ContentTypes["ArchiveCheck"]
    if ($null -eq $spCt) {
        Write-Host -ForegroundColor Yellow "The content type ArchiveCheck does not exist."
    }
    else {
        Write-Host -ForegroundColor Green "Deleting content type $($spCt.Name)"
        $spCt.Delete()
    }

    $fieldsToDelete = [System.Collections.ArrayList]@()

    foreach ($field in $spWeb.Fields) {
        if ($groupName -eq $field.Group) {
            $fieldsToDelete.Add($field) | Out-Null
        }
    }

    Write-Host -ForegroundColor Yellow "FieldsToDelete has $($fieldsToDelete.Count) elements"

    for ($i = 0; $i -lt $fieldsToDelete.Count; $i++) {
        Write-Host -ForegroundColor Yellow "Deleting $($fieldsToDelete[$i].InternalName)"
        $fieldsToDelete[$i].Delete()
    }
}