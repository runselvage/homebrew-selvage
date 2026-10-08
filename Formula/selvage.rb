class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.3.0/selvage-darwin-arm64.tar.gz"
      sha256 "c78799d182ca3a9141b8b25bb66aefd9344bc42909efaff3d9ad465339c87785"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.3.0/selvage-darwin-amd64.tar.gz"
      sha256 "a98d9b8d7ae828e2da2bf45e5ba9541dcadd99291d55f9c2626a9d0034daf806"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.3.0/selvage-linux-arm64.tar.gz"
      sha256 "0e7b4c33881fdf6d64e0da659e0fc39280dc53b27e2cd338239ef0174206aeca"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.3.0/selvage-linux-amd64.tar.gz"
      sha256 "fe2068333ca44c3693326329e1fc8f88d2ffcd5f7b84f3467c5e5f9314a0bfe7"
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
