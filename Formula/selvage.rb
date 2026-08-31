class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.23/selvage-darwin-arm64.tar.gz"
      sha256 "0479571e764bd6352ef9d1ec9a88cd2956efbf62d02bfb104484ead5b12f8210"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.23/selvage-darwin-amd64.tar.gz"
      sha256 "4836b82ce70b56c931baeeafe01fbf605578cf9ecb712d8a938c4cd20e7971e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.23/selvage-linux-arm64.tar.gz"
      sha256 "a66d5adcc3a818da59246704310ced11091c493e6064c0b7b6bbd3b926bc169b"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.23/selvage-linux-amd64.tar.gz"
      sha256 "15be95cf9519dbf4f2eb11cd37a965bc6893913c456ce1491d3725c05abaf646"
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
