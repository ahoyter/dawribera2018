echo ^<html^>^<head^>^<title^>lista de procesos svchost.exe^</title^>^</head^>^<body^>^<pre^> > usageGreaterThan1000.html
tasklist /fi "memusage gt 10000" /fo table >> usageGreaterThan1000.html
echo ^</pre^>^</body^>^</html^> >> usageGreaterThan1000.html

@echo off
cls
call rake
pause