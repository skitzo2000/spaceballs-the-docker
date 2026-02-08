# Spaceballs the Docker

A minimal Docker meant for educational purposes that prints **Spaceballs** quotes in random terminal colors. Alpine-based, no extra packages.

## Quick start

**Default — one quote and exit:**
```bash
docker build -t spaceballs .
docker run --rm spaceballs
```

**Loop mode — keep printing quotes every few seconds:**
```bash
docker run --rm -e LOOP=1 spaceballs
```

**Loop with custom interval (seconds):**
```bash
docker run --rm -e LOOP=1 -e INTERVAL=5 spaceballs
```

## Build

```bash
docker build -t spaceballs .
```

**Or use the image from GitHub Container Registry:**

```bash
docker run --rm ghcr.io/skitzo2000/spaceballs-the-docker:latest
```

The workflow builds and pushes on every push to `main`.

Uses Alpine only — no deps. Each quote is printed in a random color (red, green, yellow, blue, magenta, cyan, bold).

## Environment

| Variable   | Default | Description |
|-----------|---------|-------------|
| `LOOP`    | `0`     | Set to `1` to keep printing quotes (default is one quote then exit). |
| `INTERVAL`| `3`     | Seconds between quotes when `LOOP=1`. |

## Example

Each run picks a random quote and color (red, green, yellow, blue, magenta, cyan, or bold):

```
May the Schwartz be with you
```
