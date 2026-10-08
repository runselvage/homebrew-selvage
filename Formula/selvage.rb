class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.3.1/selvage-darwin-arm64.tar.gz"
      sha256 "2119505fec4559f2f72d24f3a50f9a6c5cca619dd7a0572da4370b6d421ad9a5"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.3.1/selvage-darwin-amd64.tar.gz"
      sha256 "6ceb1f05d06dc535c808194efe2fc121a5f15c9ffc42e42223b6c6d85a8a3f04"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.3.1/selvage-linux-arm64.tar.gz"
      sha256 "a232c6bedba5ec566dd279a8391eda591da265b4422862007fa3e4ff306075ed"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.3.1/selvage-linux-amd64.tar.gz"
      sha256 "7c97695675d97972cc34ff88f7f28f76c83db08957da72fdb673cf5803eb8b65"
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
