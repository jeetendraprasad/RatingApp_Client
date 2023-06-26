echo %~dp0

SET PATH=%SystemRoot%\System32\WindowsPowerShell\v1.0\;%PATH%

powershell -command " 'node version is' ; node --version; "
node --version

dir
cd client

powershell -command " npm install -g @angular/cli@15.0.0 "

%SystemRoot%\System32\where.exe ng.cmd

powershell -command " ng.cmd version "

%SystemRoot%\System32\where.exe ng.cmd
%SystemRoot%\System32\where.exe npm.cmd

powershell -command " npm.cmd i "

powershell -command " ng.cmd build --base-href /eapp/ "

dir
tree

@REM PENDING is deployment in
@REM local macine : C:\tmp\client
@REM server : development@192.168.x.y

exit /b 0