# Remove existing output contents
$outputDirectory = "$(Get-Location)\output\*"
Remove-Item -Path $outputDirectory -Recurse

# Get input Images
$images = Get-ChildItem -Path "$(Get-Location)\input\" -Include *.jpg, *.png, *.jpeg, *.gif -Recurse
foreach ($image in $images) {

    # Convert to webp and place in output folder
    $filename = $image.BaseName + ".webp"
    $outputPath = "$(Get-Location)\output\$filename"
    cwebp.exe -q 75 $image.FullName -o $outputPath
}