class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.12/selvage-darwin-arm64.tar.gz"
      sha256 "91615df8396cce921542815d54bbad80fcd4d449c422f2b3d7c2309a68df1069"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.12/selvage-darwin-amd64.tar.gz"
      sha256 "40f92c9b7c3a2ef23f423aa16f465ce4e3fb9ea225df7e1911ad33598eff4502"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.12/selvage-linux-arm64.tar.gz"
      sha256 "fb9bfd26812952c349b57a3558a235ce703ef77eaae33b7b19031ed770acf78d"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.12/selvage-linux-amd64.tar.gz"
      sha256 "2c8029226d1d09aeced2b646561cc0cec51d11cfb104af691c2791c4c04eacaf"
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
