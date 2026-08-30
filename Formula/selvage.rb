class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.20/selvage-darwin-arm64.tar.gz"
      sha256 "d8bf7d9b7acde2cb3dab9aa5d50bdbb1a74a7c697628eda1d35f030624054c9b"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.20/selvage-darwin-amd64.tar.gz"
      sha256 "f14eedaa6a0b3541ba40d5e965fcc08ea8dfdfcf74de52af91dd6e1ab646860d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.20/selvage-linux-arm64.tar.gz"
      sha256 "333a0a5dc9dc66d8c7aaf29277c749a4d1cf4d62dc653763b90a9e14081ebc3b"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.20/selvage-linux-amd64.tar.gz"
      sha256 "8028e7062b6eecea0f268eb6de0349dcb139a0dfa101348b3df0f187786eb16a"
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
