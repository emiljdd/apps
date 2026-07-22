@echo off
setlocal
title Python Diagnostic

echo Python environment diagnostic
echo =============================
echo.

echo PYTHONHOME=%PYTHONHOME%
echo PYTHONPATH=%PYTHONPATH%
echo.

echo Python executables found:
where py 2>nul
where python 2>nul
echo.

echo Testing Windows Python launcher:
py -3 -c "import sys, encodings; print('OK:', sys.executable); print(sys.version)" 2>&1
echo.

echo Testing python command:
python -c "import sys, encodings; print('OK:', sys.executable); print(sys.version)" 2>&1
echo.

pause
