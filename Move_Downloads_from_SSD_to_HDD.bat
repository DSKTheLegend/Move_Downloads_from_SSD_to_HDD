@ECHO OFF
:: Checking the size of the downloads original downloads folder
"c:\Program Files\Git\bin\sh.exe" -c "du -sh C:/Users/Abhishek/Downloads" > temp.txt
set /p before=<temp.txt
"c:\Program Files\Git\bin\sh.exe" -c "awk '{print $1}' temp.txt" > temp_size.txt
set /p before_size=<temp_size.txt
del temp.txt
del temp_size.txt

:: Checking Disk Size before deletion
"c:\Program Files\Git\bin\sh.exe" -c "df -hP /c | grep -v Mount" > disk_size.txt
set /p before_disk_c=<disk_size.txt
del disk_size.txt
"c:\Program Files\Git\bin\sh.exe" -c "df -hP /d | grep -v Mount" > disk_size.txt
set /p before_disk_d=<disk_size.txt
del disk_size.txt

:: Copying the downloads folder
robocopy "C:\Users\Abhishek\Downloads" "D:\Dump Zone\Downloads_%date%" /E

:: Checking the size of the copied downloads folder
"c:\Program Files\Git\bin\sh.exe" -c "du -sh D:/Dump\ Zone/Downloads_%date%" > temp.txt
set /p after=<temp.txt
"c:\Program Files\Git\bin\sh.exe" -c "awk '{print $1}' temp.txt" > temp_size.txt
set /p after_size=<temp_size.txt
del temp.txt
del temp_size.txt

:: Just displaying some data
 
echo Old Downloads Size : %before%
echo New Downloads Size : %after%

:: If download folder size before and after download is not same the script will exit without deleting anything
IF NOT  %before_size% == %after_size% (
echo There's a difference in size of files copied.
echo Please check manually 
set /P pause=""
exit
)

echo Copy Successful
:: Incase you want to stop the script from deleting the original downloads folder
set /P pause="Press ENTER to delete the original download folder. To cancel, press Ctrl+C"

:: Deleting the original downloads folder
powershell -Command "Remove-Item 'C:\Users\Abhishek\Downloads\*' -Recurse -Force"

:: Doing some disk space calculation
"c:\Program Files\Git\bin\sh.exe" -c "df -hP /c | grep /c" > disk_size.txt
set /p after_disk_c=<disk_size.txt
del disk_size.txt
"c:\Program Files\Git\bin\sh.exe" -c "df -hP /d | grep /d" > disk_size.txt
set /p after_disk_d=<disk_size.txt
del disk_size.txt
"c:\Program Files\Git\bin\sh.exe" -c "df -hP /c | grep Mount"
echo "%before_disk_c%  - BEFORE"
echo "%after_disk_c%  - AFTER"
"c:\Program Files\Git\bin\sh.exe" -c "df -hP /d | grep Mount"
echo "%before_disk_d%  - BEFORE"
echo "%after_disk_d%  - AFTER"

:: Script to see the file size of the copied items
start cmd /k "D:\Batch Jobs\big_files.bat"&
start cmd /k "D:\Batch Jobs\dump_zone_size.bat"&
:: A random pause before exiting the script so that you can see everything the script has done
:: This can be commented out if you're confident that the script works fine
:: This will totally automate the script with no manual intervention being required
set /P pause=""