# 🚀 Docker Build Speed Test

Ein elegantes Tool zum Vergleichen der Docker-Build-Geschwindigkeit auf verschiedenen Systemen.

## ✨ Features

- Übersichtliche Fortschrittsanzeige mit Loading-Animation
- Präzise Zeitmessung des Build-Prozesses
- Automatische Verifizierung des Build-Ergebnisses
- Minimale, aber informative Ausgabe

## 📋 Voraussetzungen

- Docker muss installiert sein

## 🚀 Schnellstart

1. Repository klonen:
```bash
git clone git@github.com:freudenthaler-io/docker-speed-test.git
cd docker-speed-test
```

2. Test ausführen:
```bash
./run-speedtest.sh
```

## 📊 Beispielausgabe

```
🚀 Docker Speed Test

🔄 Starte Geschwindigkeitstest...

✓ Bereinige alte Images
✓ Lade Ubuntu Base Image

⏱️  Messe Build-Geschwindigkeit...
✓ Baue Docker Image

📊 Ergebnis:
Build-Zeit: 41.78 Sekunden

✓ Verifizierung erfolgreich
```

## 🔍 Details

Das Test-Image basiert auf `ubuntu:latest` und kompiliert ein einfaches C-Programm. Der gesamte Build-Prozess läuft automatisiert ab und zeigt nur die relevanten Informationen an.

## 📜 Lizenz

Dieses Projekt steht unter der [MIT-Lizenz](LICENSE).

