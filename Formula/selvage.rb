class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.10/selvage-darwin-arm64.tar.gz"
      sha256 "813275c799f7f1c646d2647022c1968e2e1f45873995df2dd1eba1f12990a22a"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.10/selvage-darwin-amd64.tar.gz"
      sha256 "fec4777de89f1d7f60dbaf55d4a9fa88aa1c4b25eaedfc38ecf175745b25e3c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.10/selvage-linux-arm64.tar.gz"
      sha256 "caea0adf34df84c310adaab8b1e7806ac1a576837eb46c4c7239839dc895cb10"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.10/selvage-linux-amd64.tar.gz"
      sha256 "60beb67669796064184de40912e4c781cc4b95369366899864bfd1eedbfeb9f2"
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
