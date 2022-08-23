Clear-Host
$FolderName = "min\"
if (-Not (Test-Path $FolderName)) {
    #PowerShell Create directory if not exists
    New-Item "$FolderName" -ItemType Directory
    Write-Host "Folder Created successfully"
}

terser "Hyphenopoly_Loader.js" "-o" "min\Hyphenopoly_Loader.js" "--comments" "-c" "unsafe" "-m" "--warn"
terser "Hyphenopoly.js" "-o" "min\Hyphenopoly.js" "--comments" "-c" "passes=3,unsafe" "-m" "--warn"

robocopy "patterns\" "min\patterns" | Out-Null
robocopy "testsuite\" "min\testsuite" | Out-Null

