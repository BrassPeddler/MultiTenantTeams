@ECHO OFF
 
REM Uses the file name as the profile name
SET MSTEAMS_PROFILE=%~n0
ECHO - Using profile "%MSTEAMS_PROFILE%"
 
SET "OLD_USERPROFILE=%USERPROFILE%"
SET "USERPROFILE=%LOCALAPPDATA%\Microsoft\Teams\CustomProfiles\%MSTEAMS_PROFILE%"

REM Create downloads folder to avoid error at starting Teams
if not exist "%USERPROFILE%\Downloads\" (
    mkdir "%USERPROFILE%\Downloads\" 2>nul
)
 
ECHO - Launching MS Teams with profile %MSTEAMS_PROFILE%
cd "%OLD_USERPROFILE%\AppData\Local\Microsoft\Teams"
"%OLD_USERPROFILE%\AppData\Local\Microsoft\Teams\Update.exe" --processStart "Teams.exe"
