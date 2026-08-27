class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.9/selvage-darwin-arm64.tar.gz"
      sha256 "bd467207661fea64d44a8c16baa4fed9a517ba7e52dc17b52695ad8b097bab5e"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.9/selvage-darwin-amd64.tar.gz"
      sha256 "e3409575a65b823741e9c76229001a638c8c5e7aa48084318419b2e5b37d12c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.9/selvage-linux-arm64.tar.gz"
      sha256 "968819489738b2d52a9eeb4f1c95516213aaf539d62f99c76d746ae5371cc3e6"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.9/selvage-linux-amd64.tar.gz"
      sha256 "a44bf1b021d08107a108512d175240cc2d4cf5657b5808e6d1e6cf044bed7c1a"
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
