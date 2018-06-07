echo ^<html^>^<head^>^<title^>lista de procesos cuyo propietario no sea el usuario^</title^>^</head^>^<body^>^<pre^> > userProccessNotOwned.html
tasklist /fi "services ne ooqq" /fo list >> userProccessNotOwned.html
echo ^</pre^>^</body^>^</html^> >> userProccessNotOwned.html

@echo off
cls
call rake
pause