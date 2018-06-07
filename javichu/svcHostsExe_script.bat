echo ^<html^>^<head^>^<title^>lista de procesos svchost.exe^</title^>^</head^>^<body^>^<pre^> > svchosts.html
tasklist /fi "imagename eq svchost.exe" /fo table >> svchosts.html
echo ^</pre^>^</body^>^</html^> >> svchosts.html

@echo off
cls
call rake
pause