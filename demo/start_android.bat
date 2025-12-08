@echo off
echo Checking available devices...
flutter devices
echo.
echo Starting Android emulator (if available)...
flutter emulators --launch
pause

