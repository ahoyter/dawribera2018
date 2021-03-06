$User = "Domain01\User01"

#The second command uses the ConvertTo-SecureString cmdlet to create a secure string from a plain text password. The command uses the *AsPlainText* parameter to indicate that the string is plain text and the *Force* parameter to confirm that you understand the risks of using plain text.
$PWord = ConvertTo-SecureString -String "P@sSwOrd" -AsPlainText -Force

#The third command uses the New-Object cmdlet to create a **PSCredential** object from the values in the $User and $PWord variables.
$Credential = New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $User, $PWord
$Credential