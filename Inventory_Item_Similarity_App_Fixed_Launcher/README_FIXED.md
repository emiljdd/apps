# Inventory Similarity App — Fixed Launcher

## Why the original error occurred

`ModuleNotFoundError: No module named 'encodings'` means Windows found a Python executable,
but that executable could not locate Python's standard library. This is normally caused by:

- an incomplete or damaged Python installation;
- an incorrect `PYTHONHOME` environment variable;
- an incorrect `PYTHONPATH` environment variable;
- a copied or portable `python.exe` without its `Lib` folder;
- PATH pointing to an obsolete Python installation.

## Recommended procedure

1. Extract this ZIP into a normal local folder, such as:
   `C:\InventorySimilarityApp`
2. Double-click `run_app_safe.bat`.
3. The launcher clears `PYTHONHOME` and `PYTHONPATH` for the session.
4. It finds a working Python installation.
5. It creates an isolated `.venv` environment.
6. It installs the required packages.
7. It starts Streamlit.

## If no working Python is found

Install the current 64-bit Python from python.org.

During installation, select:

- Add python.exe to PATH
- Install launcher for all users
- pip
- venv

Then run `run_app_safe.bat` again.

## Remove bad Python environment variables

Open:

`Windows Search > Edit the system environment variables > Environment Variables`

Delete `PYTHONHOME` and `PYTHONPATH` from both User variables and System variables,
unless your IT department intentionally configured them.

## Diagnostic

Run `python_diagnostic.bat` to see which Python executables Windows is finding.
