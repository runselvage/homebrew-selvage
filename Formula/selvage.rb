class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.31/selvage-darwin-arm64.tar.gz"
      sha256 "0d18633566db02c85858fb9d3a9ac5438a16886b7a4afc9dd68ce9ad8bda9587"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.31/selvage-darwin-amd64.tar.gz"
      sha256 "6f2e484a586bcaf4fd959614b32bedc40dcd859610a2e74db986cda115d6cd13"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.31/selvage-linux-arm64.tar.gz"
      sha256 "d147c42e2340d70f6db130bdc0a6c0bd5a74347da64b4aaea142483cc51cb4c1"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.31/selvage-linux-amd64.tar.gz"
      sha256 "5cce1a9dca9805b13331cd503046c98d0e583c509000c45a721bdb82442ac2cc"
    end
  end

  def install
    bin.install "selvage"
    bin.install_symlink "selvage" => "slv"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/selvage --version 2>&1")
  end
end
