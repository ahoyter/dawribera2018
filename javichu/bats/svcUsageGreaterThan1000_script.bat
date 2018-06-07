echo ^<html^>^<head^>^<title^>lista de procesos cuyo uso de memoria es mayor de 1000k^</title^>^</head^>^<body^>^<pre^> > usageGreaterThan1000.html
tasklist /fi "memusage gt 1000" /fo table >> usageGreaterThan1000.html
echo ^</pre^>^</body^>^</html^> >> usageGreaterThan1000.html

@echo off
cls
call rake
pause