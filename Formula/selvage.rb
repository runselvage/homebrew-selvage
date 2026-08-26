class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.0/selvage-darwin-arm64.tar.gz"
      sha256 "749465d01bd8223710005a85d5124bf66d1ca90074ae6082aaa23a5e5061d8ed"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.0/selvage-darwin-amd64.tar.gz"
      sha256 "90e3b2d0453f43fe855d1cb75b5c21767c0941f8a9973f540baba8b0682b5237"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.0/selvage-linux-arm64.tar.gz"
      sha256 "b1bc1783e86005bcce777cf4770e3563798a0ff79e8dc7d87d41741b7d09cc76"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.0/selvage-linux-amd64.tar.gz"
      sha256 "ede7731e07bdc58e89f13013507d0c386e0167848176645f13164089de405cb3"
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
