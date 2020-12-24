@ECHO OFF

"c:\Program Files\Git\bin\sh.exe" -c "du -sh D:/Dump\ Zone/Downloads_%date%/* | sort -hr"
set /P pause=""
exit