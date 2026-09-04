class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.32/selvage-darwin-arm64.tar.gz"
      sha256 "c032f53fef060d1e3a9b811737376206aa58c06917b2c8b3c611803fc1392974"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.32/selvage-darwin-amd64.tar.gz"
      sha256 "3b8147b7b393bb0aa1908cdd8f1bca0506821e15afb23eeac4dbe556f5fddddf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.32/selvage-linux-arm64.tar.gz"
      sha256 "e9e04ba70a0d6a37df49d997affc0ce88240cf8db99d6f667f147f322d0121a2"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.32/selvage-linux-amd64.tar.gz"
      sha256 "4e1a467ee0ed6fc7fe730e10a81a96988044a5c50dae00451da087ab53d58b7f"
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
