param(
    [string]$Theme = "Nebula Drift: Rosette",
    [switch]$AsJson
)

$palette = [ordered]@{
    keyword = "#C43030"
    string  = "#E8D080"
    comment = "#4A3A6A"
    ident   = "#8AB4E8"
    warn    = "#C86020"
    number  = "#D4A020"
}

$rows = $palette.GetEnumerator() | ForEach-Object {
    [pscustomobject]@{
        Token = $_.Key
        Hex   = $_.Value
        Dark  = $true
        Group = if ($_.Key -in @('keyword', 'warn', 'number')) { 'warm' } else { 'cool' }
    }
}

function Get-ThemeSummary {
    param([object[]]$InputRows)

    $InputRows |
        Group-Object Group |
        Sort-Object Name |
        ForEach-Object {
            [pscustomobject]@{
                Group = $_.Name
                Count = $_.Count
                Tokens = ($_.Group.Token -join ', ')
            }
        }
}

if ($AsJson) {
    $rows | ConvertTo-Json -Depth 2
} else {
    Write-Host "Theme: $Theme" -ForegroundColor Cyan
    $rows | Format-Table -AutoSize
    Get-ThemeSummary -InputRows $rows | Format-Table -AutoSize
    Write-Verbose "Rendered at $(Get-Date -Format o)" -Verbose
}

switch ($Theme) {
    { $_ -match 'Rosette' } { Write-Host "Theme family: Nebula Drift" -ForegroundColor Magenta }
    default { Write-Warning "Unknown theme family" }
}

$totals = [ordered]@{}
foreach ($row in $rows) {
    if (-not $totals.Contains($row.Group)) { $totals[$row.Group] = 0 }
    $totals[$row.Group]++
}

$totals.GetEnumerator() | ForEach-Object {
    "{0}={1}" -f $_.Key, $_.Value
}
