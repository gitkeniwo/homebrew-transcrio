<p align="center"><img src="transcrio.png" width="384" height="384" alt="Transcrio app icon"></p>

# Transcrio

Homebrew tap and releases for **Transcrio**, a macOS app for local audio and video transcription. Drop in files, and Transcrio transcribes them on your Mac with Qwen3-ASR (MLX), and exports text, SRT, VTT and JSON. Nothing leaves your machine.

## Install

```sh
brew install --cask gitkeniwo/transcrio/transcrio
```

Or download the DMG from [Releases](https://github.com/gitkeniwo/homebrew-transcrio/releases/latest), open it and drag Transcrio into Applications.

Transcrio runs the `transcribe` command-line tool, which each release ships as a wheel. Install it once with [uv](https://docs.astral.sh/uv/):

```sh
brew install uv ffmpeg   # the cask installs these for you
uv tool install --python 3.12 https://github.com/gitkeniwo/homebrew-transcrio/releases/download/v0.1.0/transcribe-0.1.0-py3-none-any.whl
```

Requires macOS 14 (Sonoma) or later on Apple silicon.

### First launch

Transcrio is not notarized, so macOS blocks it the first time you open it. Open **System Settings › Privacy & Security**, find *"Transcrio" was blocked…* and click **Open Anyway**.

Speech models are downloaded on first use (Transcrio › Models) into `~/.cache/huggingface`.

## Upgrade / uninstall

```sh
brew update && brew upgrade --cask transcrio
uv tool install --force --python 3.12 https://github.com/gitkeniwo/homebrew-transcrio/releases/download/v0.1.0/transcribe-0.1.0-py3-none-any.whl

brew uninstall --cask transcrio          # keep settings and history
brew uninstall --zap --cask transcrio    # also remove settings and run history
uv tool uninstall transcribe
```

`--zap` leaves the downloaded models in `~/.cache/huggingface`; remove them in Transcrio › Models before uninstalling if you want the space back.
