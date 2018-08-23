# #############################################################################
# GL Education - SCRIPT - POWERSHELL
# NAME: VisiotoPNG.ps1
# 
# AUTHOR:  Andrew Urwin
# DATE:  30.04.2018
# 
# COMMENT:  This script will export all visio drawings within the current directory to png format and append -1 to the original name
#
# VERSION HISTORY
# 1.1 26.04.2018 Adding -1 to output file name
# 1.0 06.04.2018 Initial Version.
# 
#
# #############################################################################


# Powershell script that exports visio drawings to png

$outputFormat = "-1.png"
$inputFilePattern = "*.vsdx"

# Load Visio Interop Assembly
[Reflection.Assembly]::LoadWithPartialname("Microsoft.Office.Interop.Visio") > $null

# Visio Settings
$visOpenRO = 2
$visOpenMinimized = 16
$visOpenHidden = 64
$visOpenMacrosDisabled = 128
$visOpenNoWorkspace = 256


function Export-VisioDrawing($file)
{
	$flags = [System.Convert]::ToInt16($visOpenRO + $visOpenMinimized + $visOpenHidden + $visOpenMacrosDisabled + $visOpenNoWorkspace)
	$application = New-Object "Microsoft.Office.Interop.Visio.ApplicationClass"
	$document = $application.Documents.OpenEx($file.FullName, $flags)

	foreach($page in $document.Pages)
	{

		$fileNameWithoutExtension = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)

		# if document contains multiple pages, append page name to output file name
		# otherwise use the same name as the input file

		if($document.Pages.Count -gt 1)
		{
			$imagePath = Join-Path $file.Directory.FullName "$($fileNameWithoutExtension)_$($page.Name)$($outputFormat)"
		}
		else
		{
			$imagePath = Join-Path $file.Directory.FullName "$($fileNameWithoutExtension)$($outputFormat)"
		}

		$page.Export($imagePath)
	}
	$document.Close()
	$application.Quit()
}

# Get visio files in the current directory and export all of them
$files = Get-ChildItem $inputFilePattern
foreach($file in $files)
{
	Export-VisioDrawing $file
}