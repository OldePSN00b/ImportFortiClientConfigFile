#This script imports a prewritten FortiClient config file

#Import Forticlient Configuration File
$fcConfigPath = "C:\Program Files\Fortinet\FortiClient\FCConfig.exe"
$configFilePath = *your config path*\Forticlient.conf"
$password = "*your set config file password*"
$logFilePath = "*your log path*\FCConfigLog.txt"

# Run the command and capture the output
$arguments = "-m all -f `"$configFilePath`" -o import -i 1 -p $password"
$process = Start-Process -FilePath $fcConfigPath -ArgumentList $arguments -NoNewWindow -PassThru -RedirectStandardOutput $logFilePath -RedirectStandardError $logFilePath

# Wait for the process to exit
$process.WaitForExit()

# Optional: Read and output the log content to the console
$logContent = Get-Content -Path $logFilePath
$logContent
