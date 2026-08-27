class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.4/selvage-darwin-arm64.tar.gz"
      sha256 "85a0ee07126a1d59f8f6360c537e3027e4b40f940742734cf0e58a58da50bec9"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.4/selvage-darwin-amd64.tar.gz"
      sha256 "f6309da714c61a7b5f55eb438b1771a43a8214fecf903b2e94e5cfb72e91ecfa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.4/selvage-linux-arm64.tar.gz"
      sha256 "94e543af2a852e07f17e61b4f8a28a0ab7263272c24bfc9e9c93c12adc4beec5"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.4/selvage-linux-amd64.tar.gz"
      sha256 "99aab264882155167867e7f07d68dc076008ebb2172512aa87c51584b144ba7f"
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
