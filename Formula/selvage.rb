class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.2/selvage-darwin-arm64.tar.gz"
      sha256 "f657c46774d0f5115b390c2a1be620b653e3192ce1d7ac117c7ad87ebc714575"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.2/selvage-darwin-amd64.tar.gz"
      sha256 "98c13a3c483cd17653295564c4659f8c93ad088e2b848524d5b4da49cde2f6ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.2/selvage-linux-arm64.tar.gz"
      sha256 "619b2cdd7b6c606fc91f7fb24629dc2c2ddbff3cfb3740c888c764fd1722e57b"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.2/selvage-linux-amd64.tar.gz"
      sha256 "15f9f600eaca8391d00adba5b30c67b55c9d1a715ba991c8e957398e2cb93e56"
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
