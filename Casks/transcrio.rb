cask "transcrio" do
  version "0.1.1"
  sha256 "285a83f4c10d9fd83f0f0ca49b8b3171db38258140ef5dd78c465538db67ec22"

  url "https://github.com/gitkeniwo/homebrew-transcrio/releases/download/v#{version}/Transcrio-#{version}.dmg"
  name "Transcrio"
  desc "Local audio and video transcription with Qwen3-ASR on Apple silicon"
  homepage "https://github.com/gitkeniwo/homebrew-transcrio"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on formula: "ffmpeg"
  depends_on formula: "uv"
  depends_on macos: :sonoma

  app "Transcrio.app"

  uninstall quit: "io.github.gitkeniwo.transcribe"

  zap trash: [
    "~/Library/Application Support/Transcribe",
    "~/Library/Caches/io.github.gitkeniwo.transcribe",
    "~/Library/HTTPStorages/io.github.gitkeniwo.transcribe",
    "~/Library/Preferences/io.github.gitkeniwo.transcribe.plist",
    "~/Library/Saved Application State/io.github.gitkeniwo.transcribe.savedState",
  ]

  caveats <<~EOS
    Transcrio runs the `transcribe` command-line tool. Open Transcrio and click
    "Install Command-Line Tool"; after an upgrade it offers "Update Command-Line Tool".
    To install it by hand instead:
      uv tool install --force --python 3.12 https://github.com/gitkeniwo/homebrew-transcrio/releases/download/v#{version}/transcribe-#{version}-py3-none-any.whl

    Transcrio is not notarized. The first time you open it, macOS blocks it:
      System Settings › Privacy & Security › "Transcrio" was blocked… › Open Anyway

    Speech models are downloaded on first use into ~/.cache/huggingface;
    `brew uninstall --zap` leaves them there.
  EOS
end
