# This is the folder, where you want to write logs
cd $home\desktop
# Convert today's date to string
$date = (Get-Date).ToString('yyyy-MM-dd')
# Constructing complete file name with path.
$logFile = "$home\desktop\Log_" + $date + ".txt"
# Path of the actual script and sending warning and error to logfile.
.\yourscript.ps1 3>&1 2>&1 | Out-file -filePath $logFile