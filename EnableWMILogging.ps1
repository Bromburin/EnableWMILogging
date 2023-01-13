# 1.Enable the WMI Activity log
$log = Get-WinEvent -ListLog * | Where LogName -match "WMI"
$log.set_isEnabled($true)
$log.SaveChanges()
# 2. Read last 4 events from the log
Get-WinEvent $log.LogName |
Sort TimeCreated | 
Select -last 4 | 
ft -Wrap -Autosize
