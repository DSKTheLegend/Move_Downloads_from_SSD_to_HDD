# Move_Downloads_from_SSD_to_HDD

##This file moves the Downloads folder from SSD to HDD

If you're running a machine with a smaller C: drive and you tend to download a lot of stuff and then don't get time to clean it up, this script is for you.

It's just a regular batch file which moves everything from "C:\Users\<<username>>\Downloads" to "D:\Dump Zone\Downloads_%date%"
### Do replace <<username>> in the script with your window's username

## Requirements :- 

1) You need to have the folder structure that I mentioned above. If not, create the folder structure or change the path in the script.
2) For the first command it executes to check the folder size, it requires git installed. If you donot have it, make sure that you comment it 


## What to do after downloading this script ?

Well, it's upto you now. I've created a scheduled job that will trigger this job every sunday after my first login. But it's totally upto you how you want to use it.


## How to know something is going wrong ?

Well, this is a pet project of mine and I just created it so that I don't have to do the work manually everytime I didn't think of handling all the scenarios.
If the script is just starting and exiting, this might mean that something is not right.
Maybe the command is supported in your system or maybe some syntax error you made while making changes in the file.
In order to debug it, remove the `@ECHO OFF` flag present in the top of the file and try to execute it from a command prompt.
You'll start seeing all the errors.

## What is that big_files.bat file for ?

That file is there just to tell you about the size of the content you just moved :)


### In case you feel that I've made you're life simple or you're unable to use it properly, feel free to drop me an email at `dsklegend@live.com` and I might revert you as soon as I get some time.

### Thanks for reading this far.

### Cheers !!
