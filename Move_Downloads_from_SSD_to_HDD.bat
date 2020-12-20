@ECHO OFF
:: Checking the size of the downloads original downloads folder
"c:\Program Files\Git\bin\sh.exe" -c "du -sh C:/Users/<<username>>/Downloads" > temp.txt
set /p before=<temp.txt
"c:\Program Files\Git\bin\sh.exe" -c "awk '{print $1}' temp.txt" > temp_size.txt
set /p before_size=<temp_size.txt
del temp.txt
del temp_size.txt

:: Copying the downloads folder
robocopy "C:\Users\<<username>>\Downloads" "D:\Dump Zone\Downloads_%date%" /MIR /E

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

:: If download folder size before and after download is not same
IF NOT  %before_size% == %after_size% (
	echo There's a difference in size of files copied.
	echo Please check manually 
)

:: If download folder size before and after download is same 
IF %before_size% == %after_size% (
	echo Copy Successful
	set /P pause="Press ENTER to delete the original download folder. To cancel, press Ctrl+C"
	powershell -Command "Remove-Item 'C:\Users\<<username>>\Downloads\*' -Recurse -Force"
)



:: A random pause before exiting the script so that you can see everything the script has done.
:: This can be commented out if you're confident that the script works fine. 
:: This will totally automate the script with no manual intervention being required
set /P pause=""