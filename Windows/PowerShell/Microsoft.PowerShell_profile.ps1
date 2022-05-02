# Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Use ctrl+backspace to delete words in VSCode integrated terminal
# When using PowerShell as an integrated terminal in VSCode, ctrl+backspace combo doesn't delete words. ctrl+backspace is somehow mapped to ctrl+w and we need to override this mapping.
if ($env:TERM_PROGRAM -eq "vscode") {
  Set-PSReadLineKeyHandler -Chord 'Ctrl+w' -Function BackwardKillWord
}

# Create a new file with touch command
# Command: touch hey.js
function touch
{
    $file = $args[0]
    if($file -eq $null) {
        throw "No filename supplied"
    }

    if(Test-Path $file)
    {
        throw "file already exists"
    }
    else
    {
        # echo $null > $file
        New-Item -ItemType File -Name ($file)
    }
}

$ENV:STARSHIP_CONFIG = "D:\pedrojosawczuk\.config\starship.toml"
$ENV:STARSHIP_CACHE = "D:\pedrojosawczuk\.cache\starship"
$ENV:STARSHIP_DISTRO = "者 "
Invoke-Expression (&starship init powershell)
