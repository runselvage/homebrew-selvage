class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.3/selvage-darwin-arm64.tar.gz"
      sha256 "aebdeda2ad30d640f9eea7247067836215ffa0f658c85541cddf25b6197e39f9"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.3/selvage-darwin-amd64.tar.gz"
      sha256 "33a16544cd4e35938bec0f66d23ba6a27566dceb4fed1113e0dae7624a7747a3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.3/selvage-linux-arm64.tar.gz"
      sha256 "3c48524a3805aa96a60f3b9fba74d73323989b3bd74ce7990b12d6cc8faa38b9"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.3/selvage-linux-amd64.tar.gz"
      sha256 "a30a518145ed3f4356617e2c11563f4a8d4170dfb5852e5402f18dc4017a4b30"
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
