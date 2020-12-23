#Переменные
$WinType = (Get-WMIObject win32_operatingsystem).name
$zipfileToCheck = "C:\utils\Rainmeter.zip"
$exefileToCheck = "C:\utils\Rainmeter\Rainmeter.exe"
$destination="C:\utils"
$download_url = "https://itlogica.ru/files/Rainmeter/Rainmeter.zip"
$local_path = "C:\utils\Rainmeter.zip" 
$WebClient = New-Object System.Net.WebClient

#Не запускаем скрипт на серверных OS
If (-Not($WinType -match 'Server')) 

{
#Проверяем наличие rainmeter.zip
if (-not (Test-Path $zipfileToCheck -PathType leaf))
{	
	$WebClient.DownloadFile($download_url, $local_path)
	New-Item $destination -type directory -Force
}

#Проверяем наличие rainmeter.exe
if (-not (Test-Path $exefileToCheck -PathType leaf))
{
	New-Item $destination -type directory -Force
	Expand-Archive $local_path -DestinationPath $destination -Force
}

#Запускаем Rainmeter
& "C:\Utils\Rainmeter\Rainmeter.exe"
}