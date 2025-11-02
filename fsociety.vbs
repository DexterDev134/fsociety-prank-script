' fsociety prank: countdown, password gate, fake CMD spam, fullscreen BSOD with logo, and system lock

Dim shell, fso, bsodFile, batFile, password
Set shell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

' === 1. Create the fullscreen BSOD HTA with local fsociety logo ===
Set bsodFile = fso.CreateTextFile("fsociety_bsod.hta", True)
bsodFile.WriteLine "<html style='margin:0; padding:0; background-color:#000000; width:100%; height:100%; overflow:hidden;'>"
bsodFile.WriteLine "<head><title>:(</title>"
bsodFile.WriteLine "<HTA:APPLICATION ID='bsod' BORDER='none' SCROLL='no' SHOWINTASKBAR='no' SINGLEINSTANCE='yes' WINDOWSTATE='maximize' APPLICATIONNAME='fsocietyBSOD' SYSMENU='no' CAPTION='no'></head>"
bsodFile.WriteLine "<body style='margin:0; padding:0; background-color:#000000; width:100%; height:100%; overflow:hidden;'>"
bsodFile.WriteLine "<div style='position:fixed; top:0; left:0; width:100%; height:100%; background-color:#000000; display:flex; align-items:center; justify-content:center;'>"
bsodFile.WriteLine "<div style='text-align:center;'>"
bsodFile.WriteLine "<img src='fsociety_logo.png' width='150'><br><br>"
bsodFile.WriteLine "<pre style='color:#00FF00; font-family:Consolas, monospace; font-size:18px;'>"
bsodFile.WriteLine "fsociety.exe has encountered a critical exception and must terminate."
bsodFile.WriteLine ""
bsodFile.WriteLine "Technical Information:"
bsodFile.WriteLine "STOP CODE: fs0ciety (0x00000001, 0x00000002, 0x00000003, 0x00000004)"
bsodFile.WriteLine ""
bsodFile.WriteLine "Collecting system data..."
bsodFile.WriteLine "Memory dump complete."
bsodFile.WriteLine ""
bsodFile.WriteLine "If this is your first time seeing this screen, you have been fsociety'd."
bsodFile.WriteLine "Contact your system administrator or fsociety support for further assistance."
bsodFile.WriteLine ""
bsodFile.WriteLine "Press CTRL+ALT+DEL to restart your system."
bsodFile.WriteLine "</pre>"
bsodFile.WriteLine "</div></div>"
bsodFile.WriteLine "</body></html>"
bsodFile.Close

' === 2. Create the batch file with 25s fake spam and BSOD trigger ===
Set batFile = fso.CreateTextFile("fsociety_payload.bat", True)
batFile.WriteLine "@echo off"
batFile.WriteLine "title fsociety_payload"
batFile.WriteLine "color 0A"
batFile.WriteLine "cls"
batFile.WriteLine "echo fsociety owns this device..."
batFile.WriteLine "timeout /t 2 >nul"
batFile.WriteLine "echo Obtaining System32 files..."
batFile.WriteLine "timeout /t 2 >nul"
batFile.WriteLine "setlocal enabledelayedexpansion"
batFile.WriteLine "for /L %%i in (1,1,25) do ("
batFile.WriteLine "    echo Deleting C:\Windows\System32\fsociety_file_%%i.dll..."
batFile.WriteLine "    echo Deleting C:\Windows\System32\driver_%%i.sys..."
batFile.WriteLine "    echo Deleting C:\Windows\System32\config\fsociety_%%i.reg..."
batFile.WriteLine "    timeout /t 1 >nul"
batFile.WriteLine ")"
batFile.WriteLine "cls"
batFile.WriteLine "echo fsociety completed."
batFile.WriteLine "timeout /t 3 >nul"
batFile.WriteLine "taskkill /f /im explorer.exe"
batFile.WriteLine "start """" mshta.exe ""%~dp0fsociety_bsod.hta"""
batFile.WriteLine "exit"
batFile.Close

' === 3. Countdown popups ===
For i = 10 To 1 Step -1
    shell.Popup "Enter password before fsociety takes control in " & i & " seconds...", 1, "fsociety breach", 64
Next

' === 4. Password gate ===
password = InputBox("Final chance: Enter password to stop fsociety breach.", "fsociety access required")

' === 5. Launch CMD if password is incorrect ===
If password <> "251663" Then
    shell.Run "cmd /k fsociety_payload.bat", 1, False

    ' Monitor HTA — restore system when closed
    Do
        WScript.Sleep 3000
        If shell.Exec("tasklist /FI ""IMAGENAME eq mshta.exe"" | find /I ""fsociety_bsod.hta""").StdOut.ReadAll = "" Then
            shell.Run "explorer.exe", 1, False
            Exit Do
        End If
    Loop
End If