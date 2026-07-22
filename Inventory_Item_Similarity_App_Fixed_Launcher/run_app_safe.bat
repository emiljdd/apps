@echo off
setlocal EnableExtensions

title Inventory Similarity App

REM Prevent broken global Python environment variables from interfering.
set "PYTHONHOME="
set "PYTHONPATH="

cd /d "%~dp0"

echo.
echo ============================================
echo Inventory Similarity App - Safe Launcher
echo ============================================
echo.

set "PY_CMD="

REM Prefer the Windows Python launcher.
where py >nul 2>&1
if %errorlevel%==0 (
    py -3 -c "import sys, encodings; print(sys.executable)" >nul 2>&1
    if %errorlevel%==0 set "PY_CMD=py -3"
)

REM Fall back to python.exe only if it can import encodings.
if not defined PY_CMD (
    where python >nul 2>&1
    if %errorlevel%==0 (
        python -c "import sys, encodings; print(sys.executable)" >nul 2>&1
        if %errorlevel%==0 set "PY_CMD=python"
    )
)

if not defined PY_CMD (
    echo ERROR: No working Python installation was found.
    echo.
    echo Install the current 64-bit Python from python.org.
    echo During installation, select:
    echo   1. Add python.exe to PATH
    echo   2. Install launcher for all users
    echo.
    echo Also remove any Windows environment variables named:
    echo   PYTHONHOME
    echo   PYTHONPATH
    echo.
    pause
    exit /b 1
)

echo Working Python command: %PY_CMD%
%PY_CMD% --version
echo.

if not exist ".venv\Scripts\python.exe" (
    echo Creating isolated Python environment...
    %PY_CMD% -m venv .venv
    if errorlevel 1 (
        echo.
        echo ERROR: The virtual environment could not be created.
        echo Repair or reinstall Python and include the venv and pip components.
        pause
        exit /b 1
    )
)

set "VENV_PY=.venv\Scripts\python.exe"

"%VENV_PY%" -c "import sys, encodings; print('Virtual environment:', sys.executable)" >nul 2>&1
if errorlevel 1 (
    echo Existing virtual environment is damaged. Rebuilding it...
    rmdir /s /q ".venv"
    %PY_CMD% -m venv .venv
    if errorlevel 1 (
        echo ERROR: The virtual environment could not be rebuilt.
        pause
        exit /b 1
    )
)

echo Updating pip...
"%VENV_PY%" -m pip install --upgrade pip
if errorlevel 1 goto :install_error

echo Installing application requirements...
"%VENV_PY%" -m pip install -r requirements.txt
if errorlevel 1 goto :install_error

echo.
echo Starting application...
"%VENV_PY%" -m streamlit run app.py

if errorlevel 1 (
    echo.
    echo The application stopped with an error.
    pause
)
exit /b 0

:install_error
echo.
echo ERROR: Python packages could not be installed.
echo Check your internet connection and any corporate proxy restrictions.
pause
exit /b 1
