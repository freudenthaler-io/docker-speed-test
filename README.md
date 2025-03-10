# Docker Build Speed Test

Dieses Repository enthält eine einfache Dockerfile, mit der du die Geschwindigkeit verschiedener Rechner beim Erstellen eines Docker-Images miteinander vergleichen kannst.

Das Docker-Image basiert auf dem aktuellen Standard Ubuntu-Image (`ubuntu:latest`) und führt grundlegende Installationen und Kompilierungen durch, um eine repräsentative Messung der Rechnerleistung zu ermöglichen.

## Voraussetzungen

- Docker muss auf deinem Rechner bereits installiert sein.

## Nutzung

### 1. Klone das Repository

```bash
git clone git@github.com:freudenthaler-io/docker-speed-test.git
cd docker-speed-test
```

### 2. Docker-Image bauen und Zeit messen

Verwende den folgenden Befehl, um das Docker-Image zu bauen und die dafür benötigte Zeit zu messen:

```bash
time docker build -t speedtest-image .
```

Notiere die ausgegebene `real` Zeit, um sie mit anderen Rechnern zu vergleichen.

**Beispielausgabe:**

```bash
real    0m12.345s
user    0m0.678s
sys     0m0.123s
```

### 3. Docker-Container starten (optional)

Überprüfe das Ergebnis, indem du das gebaute Image ausführst:

```bash
docker run --rm speedtest-image
```

Du solltest folgende Ausgabe erhalten:

```
Speed test
```

## Ergebnisse vergleichen

Vergleiche die Zeiten der verschiedenen Rechner anhand der notierten Werte, um Unterschiede in der Build-Geschwindigkeit festzustellen.

## Lizenz

Dieses Projekt steht unter der [MIT-Lizenz](LICENSE).

