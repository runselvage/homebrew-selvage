class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.13/selvage-darwin-arm64.tar.gz"
      sha256 "9e7800d6cda1577e7d8bd1c5757aa59080fc80a587fe65c58d227a55e3610c9c"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.13/selvage-darwin-amd64.tar.gz"
      sha256 "33a846845365aaa94bbee46e6b907d555d0ff45b1d9346ee6f208b5ba93b85b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.13/selvage-linux-arm64.tar.gz"
      sha256 "e13e0958d024586221c146db1bf6f74a499f0a960cd3a29a3878e8ff4407bd0a"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.13/selvage-linux-amd64.tar.gz"
      sha256 "f6e2eadba3167ece286cba079c03f51fd9f0bb51960cae7e2bf23d49f1d14c59"
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
