# Skript initialisieren
Clear-Host
Write-Host "==============================================================" -ForegroundColor Cyan
Write-Host "         Samsung App Deinstallation Tool" -ForegroundColor Yellow
Write-Host "==============================================================" -ForegroundColor Cyan
Write-Host "Aktuelles Datum: $(Get-Date -Format 'dd.MM.yyyy HH:mm')" -ForegroundColor Gray
Write-Host ""

# Arbeitsverzeichnis dynamisch setzen
$workingDirectory = "C:\Users\$([Environment]::UserName)\Documents\ADB-Nonsense-Apps-Removal"
Set-Location -Path $workingDirectory
Write-Host "Arbeitsverzeichnis: $workingDirectory" -ForegroundColor Green

# Pr�fen, ob die Dateien existieren
$appsScript = ".\apps.ps1"
$systemScript = ".\system.ps1"

# Skripte laden
try {
    . $appsScript
    . $systemScript
} catch {
    Write-Host "Fehler beim Laden der Skripte: $_" -ForegroundColor Red
    exit
}

# Benutzerabfrage
Write-Host "`n=== Konfiguration der Deinstallation ===" -ForegroundColor Cyan
$deleteData = Read-Host "Möchten Sie alle Anwendungsdaten vollständig löschen? Ja würde bedeuten, dass die Apps inklusive Catch gelöscht werden. Wenn nein, werden die Apps gelöscht, aber nicht der Catch, so dass Sie bei einer Neuinstallation der gelöschten App nicht alles von der App verlieren. (j/n)"
$uninstallFlag = if ($deleteData -eq 'j') { "" } else { "-k" }

Write-Warning "Das Entfernen von Samsung UI-Funktionen kann Ihre Benutzererfahrung beeintr�chtigen. Mit Vorsicht fortfahren."
$deleteSamsungUIFunctionality = Read-Host "`nM�chten Sie auch die Samsung UI-Funktionen entfernen? (j/n)"

if ($deleteSamsungUIFunctionality -eq 'j') {
    Write-Host "`nWICHTIG:" -ForegroundColor Yellow
    Write-Host "Stellen Sie sicher, dass Sie Ihre Daten gesichert und einen alternativen Launcher als Standard eingestellt haben." -ForegroundColor Yellow
    $backUpMade = Read-Host "Backup und alternativer Launcher vorbereitet? (j/n)"
    
    if ($backUpMade -ne 'j') {
        Write-Host "Abbruch: Bitte sichern Sie Ihre Daten und richten Sie einen Launcher ein." -ForegroundColor Red
        exit
    }
}

# Gesamtzahl der Apps berechnen
$totalApps = $apps.Count
if ($deleteSamsungUIFunctionality -eq 'j') {
    $totalApps += $system.Count
}

# Deinstallation durchf�hren
Write-Host "`n=== Deinstallation wird gestartet ===" -ForegroundColor Cyan
$currentApp = 0

foreach ($app in $apps) {
    $currentApp++
    Write-Progress -Activity "Deinstalliere Apps" -Status "$currentApp von $totalApps abgeschlossen" -PercentComplete (($currentApp / $totalApps) * 100)
    Write-Host "Deinstalliere $app..." -ForegroundColor White
    try {
        adb shell pm uninstall $uninstallFlag --user 0 "$app" | Out-Null
        Write-Host "  Erfolg: $app wurde entfernt." -ForegroundColor Green
    } catch {
        Write-Host "  Fehler: $app konnte nicht entfernt werden. ($_)" -ForegroundColor Red
    }
}

if ($deleteSamsungUIFunctionality -eq 'j') {
    foreach ($generalApp in $system) {
        $currentApp++
        Write-Progress -Activity "Deinstalliere Samsung UI-Komponenten" -Status "$currentApp von $totalApps abgeschlossen" -PercentComplete (($currentApp / $totalApps) * 100)
        Write-Host "Deinstalliere $generalApp..." -ForegroundColor White
        try {
            adb shell pm uninstall $uninstallFlag --user 0 "$generalApp" | Out-Null
            Write-Host "  Erfolg: $generalApp wurde entfernt." -ForegroundColor Green
        } catch {
            Write-Host "  Fehler: $generalApp konnte nicht entfernt werden. ($_)" -ForegroundColor Red
        }
    }
}

# Abschluss
Write-Progress -Activity "Deinstallation" -Completed
Write-Host "`n==============================================================" -ForegroundColor Cyan
Write-Host "         Deinstallation abgeschlossen" -ForegroundColor Green
Write-Host "==============================================================" -ForegroundColor Cyan
Write-Host "Vielen Dank f�r die Nutzung des Tools!" -ForegroundColor Gray