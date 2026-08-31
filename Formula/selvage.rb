class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.24/selvage-darwin-arm64.tar.gz"
      sha256 "baefb9932f995011f1b631e2244c51081f07f559a9e7ba84ae11b337abe4e5f9"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.24/selvage-darwin-amd64.tar.gz"
      sha256 "04ab644ec883448a1843ace944ca019739e89ed0f8e79d1f1ebc2c8a03169ec3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.24/selvage-linux-arm64.tar.gz"
      sha256 "861a201ae4097623a75b38194a9d050ca440dd91baf1a67840c1f3bd0b29b08a"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.24/selvage-linux-amd64.tar.gz"
      sha256 "9ef65a8cd1d0dd820051d35088854311069791851e87fa7a07336e5b9736f42c"
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
