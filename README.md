# Homebrew Tap for TiltBar

Homebrew formulae for [TiltBar](https://github.com/seriousben/tilt-status-bar) - a macOS menu bar app that shows your [Tilt](https://tilt.dev) resource status at a glance.

## Installation

```bash
brew install seriousben/tiltbar/tiltbar
```

## Usage

Make sure [Tilt](https://tilt.dev) is installed and running in your project:

```bash
# In your project directory
tilt up

# Start TiltBar
tiltbar
```

The TiltBar icon will appear in your menu bar showing the status of your Tilt resources.

## About TiltBar

TiltBar is a macOS menu bar application that provides real-time visibility into your Tilt development environment:

- 🟢 Dynamic Tilt logo - Green when all good, gray when building, red on errors
- 📊 Real-time updates - Streams directly from Tilt
- 🎯 Clean display - Just the logo when everything is green
- 🔄 Auto-reconnect - Handles Tilt restarts automatically

For more information, visit the [main repository](https://github.com/seriousben/tilt-status-bar).

## Requirements

- macOS 13.0+
- [Tilt CLI](https://docs.tilt.dev/install.html) installed

## Support

For issues, feature requests, or questions, please visit:
https://github.com/seriousben/tilt-status-bar/issues
