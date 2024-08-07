@echo off
setlocal

:: Define the URL of the Tor Browser
set "TOR_URL=https://www.torproject.org/dist/torbrowser/13.5.2/tor-browser-windows-x86_64-portable-13.5.2.exe"

:: Define the filename for the downloaded installer
set "TOR_FILE=torbrowser-installer.exe"

:: Define the filename for the text file
set "TEXT_FILE=links.txt"

:: Check if curl is available
where curl >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo curl is not installed. Please install curl to proceed.
    exit /b 1
)

:: Download the Tor Browser installer
echo Downloading Tor Browser...
curl -L -o "%TOR_FILE%" "%TOR_URL%"

:: Check if the download was successful
if exist "%TOR_FILE%" (
    echo Download complete!
) else (
    echo Download failed!
    exit /b 1
)

:: Install Tor Browser silently
echo Installing Tor Browser...
start /wait "" "%TOR_FILE%" /SILENT

:: Check if installation was successful
if %ERRORLEVEL% EQU 0 (
    echo Installation complete!
) else (
    echo Installation failed!
    exit /b 1
)

:: Create the .txt file with the specified content
echo Creating text file...
(
    echo search7tdrcvri22rieiwgi5g46qnwsesvnubqav2xakhezv4hjzkkad.onion
    echo torgleit7pnoex7anj7st6zpv6gtyesrluwi63uyoumnee6bvmnhdsid.onion
    echo kt2zeznlmvype7pzkgdntj7tlj2lmaub2fzonlfm3qqdq67nxgxyueyd.onion
) > "%TEXT_FILE%"

:: Check if the text file was created successfully
if exist "%TEXT_FILE%" (
    echo Text file created!
) else (
    echo Failed to create text file!
    exit /b 1
)

:: Open the .txt file
echo Opening text file...
start "" "%TEXT_FILE%"

:: End of script
endlocal
pause
