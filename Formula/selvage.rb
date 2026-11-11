class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.4.0/selvage-darwin-arm64.tar.gz"
      sha256 "c3870705d214805c89f2f9f0a632c0b8bcb48d531e749cce6a7ee11e576108c3"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.4.0/selvage-darwin-amd64.tar.gz"
      sha256 "bb01a6ddbc2f366fe18ffd6ed3bd6705da1bb60c18562d8ac94b5c263fbb8687"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.4.0/selvage-linux-arm64.tar.gz"
      sha256 "22cc1d505f97981d7f5d08e3c554a8df79eff74e50b3fefdd6bd7ae3b02cd2e7"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.4.0/selvage-linux-amd64.tar.gz"
      sha256 "2d9483f583a0478224747c0a6f2883dfc964bcaf569e0a3fb5f55c445708bb7f"
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
