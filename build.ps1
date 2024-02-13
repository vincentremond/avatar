$OriginalBackgroundColor = "#484aa0"
$OriginalForegroundColor = "#b2b3de"
$OriginalGlyph = "󰂣"


$Avatars = @()

$Avatars += @{
  Name            = "K"
  BackgroundColor = "#008578"
  ForegroundColor = "#ffffff"
  Glyph           = ""
}

$Avatars += @{
  Name            = "E"
  BackgroundColor = "#000000"
  ForegroundColor = "#f08200"
  Glyph           = ""
}

$Avatars += @{
  Name            = "V"
  BackgroundColor = "#1e3050"
  ForegroundColor = "#ffffff"
  Glyph           = ""
}

foreach ($Avatar in $Avatars) {
  Write-Host "Building avatar for $($Avatar.Name)"
  $SvgContent = Get-Content .\_avatar-template.svg

  $SvgContent = $SvgContent -replace $OriginalBackgroundColor, $Avatar.BackgroundColor
  $SvgContent = $SvgContent -replace $OriginalForegroundColor, $Avatar.ForegroundColor
  $SvgContent = $SvgContent -replace $OriginalGlyph, $Avatar.Glyph

  $SvgContent | Out-File ".\output\avatar-$($Avatar.Name).svg"


  # convert svg to png with ImageMagick
  # Commented out because ImageMagick is not handling correctly the font glyphs
  # & "C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe" ".\avatar-$($Avatar.Name).svg" ".\avatar-$($Avatar.Name).png"

  # convert svg to png with Inkscape
  & "C:\Program Files\Inkscape\bin\inkscape.exe" ".\output\avatar-$($Avatar.Name).svg" --export-filename=".\output\avatar-$($Avatar.Name).png"

}
