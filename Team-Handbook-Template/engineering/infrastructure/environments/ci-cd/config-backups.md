## CI-CD Config Backups

## TeamCity

All Scripts on ttfweap402 (use ttf\-svc-app-blobcopy account in LastPass)

* Execute Backup on TeamCity
	* C:\Scripts\TeamCity\Execute-TeamCityBackup.ps1
	* Runs at 23:59 Daily
* Move to Blob
	* C:\Scripts\TeamCity\MoveToBlob.ps1
	* Runs at 01:00 Daily
* Delete From Blob
    * C:\Scripts\TeamCity\DeleteFromBlob.ps1
	* Runs at 02:00 Daily

### Execute Backup on TeamCity

This [script](https://gitlab.com/gl-education-Infra/Team-Handbook/blob/master/engineering/infrastructure/assets/Execute-TeamCityBackup.ps1) calls the TeamCity API and triggers a backup. This backup is stored locally on the TeamCity server at F:\TeamCity\backup

### Move to Blob

This [script](https://gitlab.com/gl-education-Infra/Team-Handbook/blob/master/engineering/infrastructure/assets/MoveToBlob.ps1) moves the backups from F:\TeamCity\backup to the Azure Blob Storage account hyveproddbbackup, within the teamcityconfig container

### Delete from Blob

This [script](https://gitlab.com/gl-education-Infra/Team-Handbook/blob/master/engineering/infrastructure/assets/DeleteFromBlob.ps1) deletes backups older than 31 days from the Azure Blob Storage account hyveproddbbackup, within the teamcityconfig container

