Param($index)

if ((Get-Command "fwi-serial" -ErrorAction SilentlyContinue) -eq $null) {
	Write-Host "Unable to find fwi-serial in your PATH, please install it via pypi!"
	Exit
}

if ($index -eq $null) {
	&"fwi-serial" -l
	Write-Host "Index needed, please select Main Processor index"
	Exit
}

foreach ($sub_file in Get-ChildItem "*.sub") {
	fwi-serial -mi $index -s $sub_file -fn "/radio/$($sub_file.Name)"
}
