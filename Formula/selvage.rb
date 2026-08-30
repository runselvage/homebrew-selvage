class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.18/selvage-darwin-arm64.tar.gz"
      sha256 "1af705dd7366dfd96a1ebec47dbaa5027d95e7bbf8ad374b831b3071d9bde650"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.18/selvage-darwin-amd64.tar.gz"
      sha256 "2f5a19cfaf402bb7909809b2a06bfe634a52cacb4cd841f9400f9dedd4f067f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.18/selvage-linux-arm64.tar.gz"
      sha256 "48fde0a5da90b7b9488007b4587f177baec490057ba982a40f0bd8b95db343ab"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.18/selvage-linux-amd64.tar.gz"
      sha256 "e9987f0dd07970e776ca4631879fd256b4450623dd7c57e9284ca4b5db6762df"
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
