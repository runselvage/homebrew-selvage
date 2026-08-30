class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.16/selvage-darwin-arm64.tar.gz"
      sha256 "b0a5857344e7ecd06c904ed84125bef1ff20a46dcec554532e9c87943ea8e28c"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.16/selvage-darwin-amd64.tar.gz"
      sha256 "0041f15f59dad0c82e1a2aef352845525c976f9fb2543039fcc9a43cb52d9b70"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.16/selvage-linux-arm64.tar.gz"
      sha256 "1fe27342582139f23e42fce6bd5b4916470e2ae2076877ba568383caa4a901f5"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.16/selvage-linux-amd64.tar.gz"
      sha256 "2431f0b61b910ddeb7664c2c329dd54dc8a8477cfd4700d619420489230a5221"
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
