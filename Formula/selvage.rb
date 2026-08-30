class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.19/selvage-darwin-arm64.tar.gz"
      sha256 "ce8e508e87d34a0f1c2d50801fe1f5bf811bc1ff3d8fcb9818642f7db9bd8d4a"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.19/selvage-darwin-amd64.tar.gz"
      sha256 "f9f3902344a09eb80f0123158b213db2455583bafeca7476348ae6acfd7854b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.19/selvage-linux-arm64.tar.gz"
      sha256 "04a3b85be0fc4b825b89732d6754438451ed7aaf470af772fcb2aeb2320095ab"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.19/selvage-linux-amd64.tar.gz"
      sha256 "f74df0c07bbb2f33372f97207bfe8cdb05edd114374193283dc4be8d656a3865"
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
