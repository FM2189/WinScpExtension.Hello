# @name &Hello
# @description Hello to world or a designated person.
# @command powershell.exe   -ExecutionPolicy Bypass ^
#                           -File "%EXTENSION_PATH%" ^
#                           -name "%Name%" ^
#                           -pause
# @homepage https://github.com/Fukuda-Masataka/WinScpExtension.Hello
# @require WinSCP 6.1
# @option Name -run textbox "&Name:" ""
[CmdletBinding()]
param (
    [string]
    $name,
    [switch]
    $pause
)

$result = 0

try {
    if ( !$name ) {
        $name = "World"
    }
    Write-Host "Hello, $name."
}
catch {
    Write-Host "Error: $($_.Exception.Message)"
    $result = 1
}

# Pause if -pause switch was used.
if ($pause) {
    Write-Host "Press any key to exit..."
    [System.Console]::ReadKey() | Out-Null
}

exit $result
