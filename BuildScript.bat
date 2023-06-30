@REM : BUILD SCRIPT AND REMOTE DEPLOYMENT
@REM : THIS ASSUMES SERVER IP = %SERVER_IP%
@REM : I HAVE DYNAMIC IP. SO I NEED TO CHANGE THE SERVER EVERY TIME IN THIS SCRIPT

SET WORK_FOLDER=%~dp0
SET WORK_FOLDER=%WORK_FOLDER:~0,-1%
echo %WORK_FOLDER%

@REM SERVER_IP IS DYNAMIC IP SO I HAVE TO CHANGE THAT ALWAYS.
SET SERVER_IP=192.168.87.1
SET SERVER_ADMINUSER=development
@REM SERVER_FOLDER sould be present on server
SET SERVER_FOLDER=c:\tmp

SET PATH=%PATH%;%systemroot%\system32\inetsrv\;
SET PATH=%SystemRoot%\System32\WindowsPowerShell\v1.0\;%PATH%

powershell -command " 'node version is' ; node --version; "
node --version

dir
cd client

#powershell -command " npm install -g @angular/cli@15.0.0 "

%SystemRoot%\System32\where.exe ng.cmd

powershell -command " ng.cmd version "

%SystemRoot%\System32\where.exe ng.cmd
%SystemRoot%\System32\where.exe npm.cmd

powershell -command " npm.cmd i "

powershell -command " ng.cmd build --base-href /eapp/ "

scp -r %WORK_FOLDER%\bin\debug %SERVER_ADMINUSER%@%SERVER_IP%:%SERVER_FOLDER%\debug

ssh development@192.168.87.1 < ServerDeploymentCommands.txt

exit /b 0