#########################################################################################
# COMPANY: CDW                                                                          #
# NAME: Get-GroupAndMemebers.ps1                                                        #
#                                                                                       #
# AUTHOR:  Dean Sesko                                                                   #
#                                                                                       #
# DATE:  03/25/2014                                                                     #
#                                                                                       #
# EMAIL: Dean.Sesko@s3.cdw.com                                                          #
#                                                                                       #
# COMMENT:  Gets All Distribution groups and Memebers                                   #
#                                                                                       #
# VERSION HISTORY                                                                       #
# 1.0 03/25/2014 Initial Version.                                                       #
#                                                                                       #
#########################################################################################
#	Setup Shell
$bg = (Get-Host).UI.RawUI
$BG.BackgroundColor = "black"


$results = @()
foreach ($Group in Get-DistributionGroup) {
	$Record = $group.PrimarySmtpAddress.toString() + "," + $group.name.ToString() + "," + $group.Displayname.ToString() + ","
	$members = Get-DistributionGroupmember $Group.identity
	foreach ($member in $members) {
		
		[string]$Record = $Record + $member.PrimarySMTPAddress.tostring() + ','
	}
	
	$Results += $Record
}
$Results | Out-File C:\temp\Groups.csv