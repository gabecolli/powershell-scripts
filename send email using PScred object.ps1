$mycred = Get-AutomationPSCredential -Name 'noreply'
Send-MailMessage -From 'User01 colliga.test@outlook.com' -To 'ITGroup gcolli795@gmail.com' -Subject "Don't forget today's meeting!" -Credential $mycred -SmtpServer 'smtp-mail.outlook.com' -UseSsl