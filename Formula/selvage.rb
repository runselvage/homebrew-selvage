class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.11/selvage-darwin-arm64.tar.gz"
      sha256 "7f43388a3e6915908b19555fe040a3bcbd176b46dc1431def354876d3a0c4345"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.11/selvage-darwin-amd64.tar.gz"
      sha256 "d7637432d5aa003f5e8ca528d1f94cad6cdd7156b614005908a4130aa8c01345"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.11/selvage-linux-arm64.tar.gz"
      sha256 "a3dacfe7b3adb03b79a37d204edc6d9d215855c0a5f18a6395d292fb6fa87f0d"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.11/selvage-linux-amd64.tar.gz"
      sha256 "19209ffacb2e2dc6dc389cffefc0248003684572d512028cbe22da6c581344bc"
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
