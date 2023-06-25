echo %~dp0

SET PATH=%SystemRoot%\System32\WindowsPowerShell\v1.0\;%PATH%

powershell -command " 'node version is' ; node --version; "
node --version

dir
cd client
powershell -command " npm install -g @angular/cli@15.0.0 "
npm install -g @angular/cli@15.0.0
ng version
ng build
exit /b 0