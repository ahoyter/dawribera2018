read-host -assecurestring | convertfrom-securestring | out-file username-password-encrypted.txt
$username = "domain\username"
$password = cat username-password-encrypted.txt | convertto-securestring
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $password
$cred