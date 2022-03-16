[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint")

$site = New-Object Microsoft.SharePoint.SPSite("http://pddokuclu-test.garaio.ch/docs/2")

$groupName = "_Parl Columns"

$spWeb = $site.RootWeb

$dossierWeb = $site.OpenWeb("$($spWeb.ServerRelativeUrl)/201/18.Divers")

$list1 = $dossierWeb.GetList("$($dossierWeb.ServerRelativeUrl)/ArchiveCheck")
if ($null -eq $list1) {
    Write-Host -ForegroundColor Yellow "The list ArchiveCheck does not exist."
} else {
    $list1.AllowDeletion = $true
    $list1.Update()
    $list1.Delete()
}
$list2 = $dossierWeb.GetList("$($dossierWeb.ServerRelativeUrl)/ArchiveCopies")
if ($null -eq $list2) {
    Write-Host -ForegroundColor Yellow "The list ArchiveCopies does not exist."
} else {
    $list2.AllowDeletion = $true
    $list2.Update()
    $list2.Delete()
}

$spCt = $spWeb.ContentTypes["ArchiveCheck"]
if ($null -eq $spCt) {
    Write-Host -ForegroundColor Yellow "The content type ArchiveCheck does not exist."
} else {
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