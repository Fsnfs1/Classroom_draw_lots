@echo off
setlocal EnableDelayedExpansion

:: Set output file
set "output=random.html"
set "temp_file=temp.html"

:: Check if all required files exist
if not exist "01.txt" (
    echo ERROR: 01.txt does not exist. Please ensure the file is in the same directory!
    pause
    exit /b 1
)
if not exist "name.txt" (
    echo ERROR: name.txt does not exist. Please ensure the file is in the same directory!
    pause
    exit /b 1
)
if not exist "02.txt" (
    echo ERROR: 02.txt does not exist. Please ensure the file is in the same directory!
    pause
    exit /b 1
)

echo Found 01.txt, name.txt, and 02.txt

:: Step 1: Copy 01.txt to temporary file
copy /y "01.txt" "%temp_file%" >nul

:: Step 2: Append name.txt content with JavaScript formatting
echo const nameText = `>> "%temp_file%"
type "name.txt" >> "%temp_file%"
echo `;>> "%temp_file%"

:: Step 3: Append 02.txt to temporary file
type "02.txt" >> "%temp_file%"

:: Convert to UTF-8 and output to random.html
type "%temp_file%" > "%output%"
del "%temp_file%"

echo Done! Generated %output%

random.html
exit /b 0