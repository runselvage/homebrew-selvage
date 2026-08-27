class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.8/selvage-darwin-arm64.tar.gz"
      sha256 "c38cb6e94eb81571e725ff0d1e54a9fab78aafd57ed74b8015e5e731aef2adbc"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.8/selvage-darwin-amd64.tar.gz"
      sha256 "773576e85ec75c11542595373b57e7c01602f278c6b70e9191acda8ac4b9c2b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.8/selvage-linux-arm64.tar.gz"
      sha256 "f16b09e7c91dd22d5e6f899399b0e4516f9ccd79161ab48ae7820625ce80d6c1"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.8/selvage-linux-amd64.tar.gz"
      sha256 "3861cbbcd0c9b7fe044480d8e2ff3504ddfb8782079285bb93754d148d3810f2"
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
