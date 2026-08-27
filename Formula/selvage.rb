class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.1/selvage-darwin-arm64.tar.gz"
      sha256 "899e62d2deedbb79c294ca4e342507f73f7b85f7dc707e939152d24ea3880030"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.1/selvage-darwin-amd64.tar.gz"
      sha256 "250e8ffd300bbd916b3bef2d0476bc8963e617570a51373d104c1c536aa1d697"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.1/selvage-linux-arm64.tar.gz"
      sha256 "d188a2d3193d88971be276c565fb3d91c5aa189f4d05b6484a7f77341dd9d9b7"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.1/selvage-linux-amd64.tar.gz"
      sha256 "f5f45f52420ca201098357141ad7d65203d86d1a65fbe4a0cd860511fcfda915"
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
