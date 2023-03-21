
# PowerShell 5.1 Script by Bartlomiej Jodlowski
# It's a script for checking list of URLs in search of a regex pattern.
# Add file "links.txt" with the regex pattern on the first line,
# and the links to check on seaparate lines after that.

Write-Host "                                       .;'.'o0KXNNNNNNWWWWWWWWWNNNNXXX0c....                                       "
Write-Host "                                      .'..,oOKKXNNNWWWWWWWWWWWWNNNNXXXKOl'..                                       "
Write-Host "                                     ....'lk0KXXNNNWWWWWWWWWWWNNNNNXXXK0Ol...                                      "
Write-Host "                                     ....;ldO0KXNNNWWWWWWWWWWWWWWWNNXK00ko;....                                    "
Write-Host "                .                    . ..;clxOKXXNNWWWWWWWWWWWWWWWNXXK0Odc;. ...               ....                "
Write-Host "         ...........   .            .   .':cldOKXXNWWMMWWWWWWWWWWWNXKKOdc:,.  ..         ............              "
Write-Host "       ...':llloddddoc::,..         .    .;codx0XXNNWWWWWMWWWWWWWNNXXKkdl:'    .       ...':oooddxxxolcc;..        "
Write-Host "      .''lOXNNNWWWWWNNNX0o,.        .    .;cdxddk0KXXNNWWWWWWWWWNXXKOxdxdc'           .''cOXNNNWWWWWNNNXKd;.       "
Write-Host "     ...l0KXNNWWWWWWWNNXXKd,.            .'...   ..,:cldOO00Okdlc:,..  ....          ...cOKXNNWWWWWWNNNNXKx,.      "
Write-Host "     ..,lkKXNWWWWWWWWWNXK0x:..           ..            .;ldxo;.              .       ..'ok0XNWWWWWWWWWWNK0kc...    "
Write-Host "       ':okKXNWMWWWWWWNXKkl,. .     ...  ...           'dOKNKd'             ...        .lxk0XNWWWWWWWWNXKko;. .    "
Write-Host "       .;coOXNWWWWWWWWNX0xl,       .,'.. .;;'..       .oKKXNXKo.        .....,,.       .:dkOKNNWWWWWWWNX0ko,       "
Write-Host "       .....,:ldk00Oxoc;'...       .::,. .':olc:;;;;,,cOXNWWNKkl;;,,,;:cc;...;,        .','.,:cox00Oxoc;'',.       "
Write-Host "                'dkc.        .     .,lc'...';ldddddxxdokXNWWN0xoddooodol:'..cc.      .  .       .dOl.        .     "
Write-Host "    ....'..    .lXNO,     ...'.     .,cc,...';coodxkxl;,:lool;,cdxdoooc;...;l;      .'..''.     cKN0:     ...'.    "
Write-Host "    ,;..,clc:::cONWKdc:::c:..;.       .;;.....':odxkxd;.      'lxkxddl;...';'       ':..,llcc::ckNWXxc:::cc'.;.    "
Write-Host "    .:;..':odxxc:dxlcddoo:'.;;         .,;....';odxk0Oxc'.. .:dO0Okxoc'....'.       .;:..;codxxl:odl:oxolc'.;;.    "
Write-Host "     .''..':dxko.  .cxkdc'.''.         .c:....',lddxkkdo:;,,;cldxxxdl;...             ''.,:coxkd,  .cxkdc,..'.     "
Write-Host "      .,...;odxdc'.:oxxo;...           .:;. ...':lc;;;;;;;::;;;;;;::;'..              .;..;:ldxdc'':oxdl:'..       "
Write-Host "      .;. .';:clllllllc:'.             .cl'  ...',;coooolllllodddl;,'..               .:...,;:cccclccc:;'.         "
Write-Host "      .;'  ..,c;,,,,:c;..               ;o;   ....';:,.........,:;'...                .:,  ..,::,,;,;:;..          "
Write-Host "       ',.  ..';lddo:'..                .l:.    ....',:oxxxkkdc;'....                  ;:.  ..':oxxdc'..           "
Write-Host "       .;...  ..',,,'.. .                ;l'..     .';codddxxdl:'.    .                .:...  .',;;,'.  ..         "
Write-Host "       .:'......     ......              'o:.....   .............  ....                .:,......     ......        "
Write-Host "      ..;;,'...........';:'.             ,ol,...''.................';:,..             ..;:;'...........';:,..      "
Write-Host "   .',,:odxdc,.......,cdxdc;,'..        .;c;,:lodxdc;'..........,:oxxdl;,,'..      .',,:odxdl,.......,cdkxl;,,..   "
Write-Host "..,:;;;lkO0Okdc.   .:dkOOOd:,;;;'      .;:;;;okO000Oxoc.      'ldkOOOOkc,;;::;,..  ';;;cxO00kxl.   .;dkOOOx:,;;:;'."
Write-Host "                                                                                      "
Write-Host "                                    _  _ ____ _       ___ ____ _  _ ____ _ ____ ___   " 
Write-Host "                                    |  | |__/ |        |  |  | |  | |__/ | [__   |    " 
Write-Host "                                    |__| |  \ |___     |  |__| |__| |  \ | ___]  |    "
Write-Host "                                                                                      "

$date = Get-Date -Format "yyyyMMdd_HHmmss"
$CommonLogFile = "log_$date.txt"
$inputFile = Read-Host -Prompt 'Enter the input file path or press Enter to use the default (links.txt)'
Write-Host "The first line in links.txt should contain the regex pattern."

function Test-IsUrl {
    param(
        [string]$Url
    )
    return ([Uri]::IsWellFormedUriString($Url, [UriKind]::Absolute))
}

function Write-Log {
    param(
        [string]$Message,
        [string]$LogPath
    )
    Add-Content -Path $LogPath -Value $Message
    Write-Host $Message
}

if ([string]::IsNullOrEmpty($inputFile)) {
    $inputFile = "links.txt"
}

if (-not (Test-Path $inputFile)) {
    Write-Host "Input file not found!"
    exit 1
}

$lines = Get-Content $inputFile
$jobs = @()
$lineNumber = 0
$logMessages = @()
$pattern = 'default'

foreach ($line in $lines) {
    $lineNumber++
    if ([string]::IsNullOrEmpty($line)) {
        $warningMessage = "WARNING: Empty line at line number $lineNumber"
        $logMessages += $warningMessage
    } elseif ($lineNumber -eq 1) {
        $pattern = $line
    } elseif (Test-IsUrl $line) {
        $jobs += Start-Job -ScriptBlock {
            param($url, $lineNumber, $pattern)
            $response = Invoke-WebRequest -Uri $url -ErrorAction SilentlyContinue
            $logResult = @()
            if ($response) {
                $matches = ($response.Content | Select-String -Pattern $pattern -AllMatches).Matches
                foreach ($match in $matches) {
                    $errorMessage = "ERROR: Element $($match.Value) found on URL $url"
                    $logResult += $errorMessage
                }
                $doneMessage = "DONE: Finished processing line $lineNumber (Found $($matches.Count) matching elements)."
                $logResult += $doneMessage
            } else {
                $logResult += "FAILED: Request to $url failed or no content received."
            }
            return $logResult
        } -ArgumentList $line, $lineNumber, $pattern
    }
}

foreach ($job in $jobs) {
    $result = Receive-Job -Job $job -Wait
    Remove-Job -Job $job
    $logMessages += $result
}

foreach ($logMessage in $logMessages) {
    Write-Log -Message $logMessage -LogPath $CommonLogFile
}

Write-Log -Message "Success!" -LogPath $CommonLogFile
exit 0