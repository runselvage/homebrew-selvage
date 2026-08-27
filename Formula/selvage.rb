class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.5/selvage-darwin-arm64.tar.gz"
      sha256 "f85e594a41d21b3b1ac172ebfb12db635951dea94b2398ca2e58c28e68388e1b"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.5/selvage-darwin-amd64.tar.gz"
      sha256 "bc9565b9a2b554bcb9da75de264a420e432cce77694b66eabdd01d7105f0ed8f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.5/selvage-linux-arm64.tar.gz"
      sha256 "fff22b76b3f2a02cf35c315c5a328e9cbf97b81588912599d7b293f70d21c3de"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.5/selvage-linux-amd64.tar.gz"
      sha256 "9c38f9adc414656027c3e3e94a2a4039d938f4247d89d8050c32d1a1b968e714"
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
