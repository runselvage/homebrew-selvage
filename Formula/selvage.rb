class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.7/selvage-darwin-arm64.tar.gz"
      sha256 "3b1c1ab66dcbb0dd266cedafd71c7c150392d64e3ba34b52c44e63953a76c988"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.7/selvage-darwin-amd64.tar.gz"
      sha256 "9ef969913e5a68f9713a1abe47c0ae14d82906bdba4b1cb7028f304cf4f4b094"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.7/selvage-linux-arm64.tar.gz"
      sha256 "91e1261af0f53824fad676f16ee4c408e39035399d8944dcf35f3c12c418aff6"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.7/selvage-linux-amd64.tar.gz"
      sha256 "c9b407b43240e5dc144734db913cabd69f617049446f56461852b8346ac70032"
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
