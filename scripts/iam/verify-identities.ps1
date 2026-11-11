# Read-only IAM user and group checks — run in authorized lab session
Import-Module ActiveDirectory

$accounts = @('alex.morgan','jordan.lee')
$groups = @('GG_IT_Employees','GG_HR_Employees','GG_Finance_Employees','GG_Security_Employees')

Write-Host "=== FICTIONAL TEST USERS ==="
foreach ($account in $accounts) {
    Get-ADUser -Identity $account -Properties Enabled,Department,Title,Company -ErrorAction Continue |
        Select-Object Name,SamAccountName,Enabled,Department,Title,Company
}

Write-Host "=== DEPARTMENT GROUPS ==="
foreach ($group in $groups) {
    Get-ADGroup -Identity $group -ErrorAction Continue |
        Select-Object Name,GroupCategory,GroupScope
}

Write-Host "=== IT & FINANCE MEMBERSHIPS ==="
foreach ($group in @('GG_IT_Employees','GG_Finance_Employees')) {
    Write-Host "Group: $group"
    Get-ADGroupMember -Identity $group -ErrorAction Continue |
        Select-Object Name,SamAccountName,ObjectClass
}
