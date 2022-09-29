$mycred = Get-AutomationPSCredential -Name 'noreply'
Send-MailMessage -From 'User01 email@outlook.com' -To 'ITGroup email@gmail.com' -Subject "Don't forget today's meeting!" -Credential $mycred -SmtpServer 'smtp-mail.outlook.com' -UseSsl
