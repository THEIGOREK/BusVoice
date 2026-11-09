@echo off
chcp 65001 >nul
title BusVoice — установка через командную строку
echo ============================================
echo   BusVoice — установка (без отдельного .exe)
echo ============================================
echo.

where python >nul 2>nul
if errorlevel 1 (
    echo [!] Python не найден в PATH.
    echo     Скачайте Python 3.10–3.13 с https://www.python.org/downloads/
    echo     При установке ОБЯЗАТЕЛЬНО поставьте галочку "Add python.exe to PATH".
    echo     После установки запустите этот файл заново.
    pause
    exit /b 1
)

echo [1/3] Найден Python:
python --version
echo.

echo [2/3] Устанавливаю библиотеки (требуется интернет)...
python -m pip install --upgrade pip >nul 2>nul
python -m pip install -r requirements.txt
if errorlevel 1 (
    echo.
    echo [!] Не удалось установить библиотеки. Проверьте интернет и попробуйте
    echo     запустить install.bat ещё раз.
    pause
    exit /b 1
)
echo.

echo [3/3] Создаю ярлык на рабочем столе...
powershell -NoProfile -Command ^
  "$ws=New-Object -ComObject WScript.Shell;" ^
  "$s=$ws.CreateShortcut([Environment]::GetFolderPath('Desktop')+'\BusVoice.lnk');" ^
  "$s.TargetPath=(Get-Command pythonw).Source;" ^
  "$s.Arguments='\"'+(Join-Path $PWD 'busvoice.py')+'\"';" ^
  "$s.WorkingDirectory=$PWD;" ^
  "$s.IconLocation=(Join-Path $PWD 'icon.ico');" ^
  "$s.Save()" >nul 2>nul

echo.
echo Готово! BusVoice установлен.
echo Запустить сейчас, или ярлык "BusVoice" на рабочем столе — для следующих раз.
echo.
set /p RUN="Запустить сейчас? (y/n): "
if /i "%RUN%"=="y" start "" pythonw busvoice.py
pause
