class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.17/selvage-darwin-arm64.tar.gz"
      sha256 "5ad481acf639a6de5b31e3494a6a0ac58ea62ad1d2b1f20c9f042ec6597a4189"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.17/selvage-darwin-amd64.tar.gz"
      sha256 "bf84eac0c9228edda7fa73b6590ade24e29e40b6d7498fd818677a1c1a500f58"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.17/selvage-linux-arm64.tar.gz"
      sha256 "9fbb227731b0bc8e05d0978a473bbd891c930e5b8603693024c802b391fc71f2"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.17/selvage-linux-amd64.tar.gz"
      sha256 "0a1f9595b4a74177fa11834bbc66cd7b0e580273ff004a9030a9861064ee1278"
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
