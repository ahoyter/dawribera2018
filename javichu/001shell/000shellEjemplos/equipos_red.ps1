#ver equipos de una red
# https://stackoverflow.com/questions/15797198/powershell-get-a-list-of-network-machines?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa

#net view
#####
# Otra forma
#####
([adsi]"WinNT://WORKGROUP").Children