<p align="center"><img src="transcrio.png" width="384" height="384" alt="Transcrio app icon"></p>

# Transcrio

Homebrew tap and releases for **Transcrio**, a macOS app for local audio and video transcription. Drop in files, and Transcrio transcribes them on your Mac with Qwen3-ASR (MLX), and exports text, SRT, VTT and JSON. Nothing leaves your machine.

## Install

```sh
brew install --cask gitkeniwo/transcrio/transcrio
```

Or download the DMG from [Releases](https://github.com/gitkeniwo/homebrew-transcrio/releases/latest), open it and drag Transcrio into Applications.

Transcrio runs the `transcribe` command-line tool, which it installs itself: open Transcrio and click **Install Command-Line Tool**. It needs [uv](https://docs.astral.sh/uv/) and `ffmpeg`; the cask installs both, and with the DMG you install them yourself:

```sh
brew install uv ffmpeg
```

To install the command-line tool by hand instead (each release also ships it as a wheel):

```sh
uv tool install --force --python 3.12 https://github.com/gitkeniwo/homebrew-transcrio/releases/download/v0.1.1/transcribe-0.1.1-py3-none-any.whl
```

Requires macOS 14 (Sonoma) or later on Apple silicon.

### First launch

Transcrio is not notarized, so macOS blocks it the first time you open it. Open **System Settings › Privacy & Security**, find *"Transcrio" was blocked…* and click **Open Anyway**.

Speech models are downloaded on first use (Transcrio › Models) into `~/.cache/huggingface`.

## Upgrade / uninstall

```sh
brew update && brew upgrade --cask transcrio   # then click Update Command-Line Tool in Transcrio

brew uninstall --cask transcrio          # keep settings and history
brew uninstall --zap --cask transcrio    # also remove settings and run history
uv tool uninstall transcribe
```

Transcrio offers **Update Command-Line Tool** when the installed `transcribe` doesn't match its version. By hand, after an upgrade: `uv tool install --force --python 3.12 https://github.com/gitkeniwo/homebrew-transcrio/releases/download/v0.1.1/transcribe-0.1.1-py3-none-any.whl`.

`--zap` leaves the downloaded models in `~/.cache/huggingface`; remove them in Transcrio › Models before uninstalling if you want the space back.
