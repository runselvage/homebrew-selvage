class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.21/selvage-darwin-arm64.tar.gz"
      sha256 "d5f0f6bb19cfeb6d1bac22584f1a9e71c5c4978fdbaa947ca7b6065048107ded"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.21/selvage-darwin-amd64.tar.gz"
      sha256 "822f4ec221372634e03db22399896a96b3af35a3197ad31b4a073963f7b0ca4e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.21/selvage-linux-arm64.tar.gz"
      sha256 "ec444ff66a6a70b39cba5c73ab1bfc2953c9cc8a4a0647875a71f2d14ca56f61"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.21/selvage-linux-amd64.tar.gz"
      sha256 "3dc08bc30c9bbe4ad45d30f60d94bd88686fbdfce6b31772909271c1afd7521d"
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
