class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.15/selvage-darwin-arm64.tar.gz"
      sha256 "7865e0384ae3e5292c34d6c56e8e70373cf9807b0d1543518c05aa7eb8ff7008"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.15/selvage-darwin-amd64.tar.gz"
      sha256 "e51e303bc1a5fe3e175db648a7b0a606cfdfab4d411af50e85147ff40a410f63"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.15/selvage-linux-arm64.tar.gz"
      sha256 "1c3181310d85c777edc310307557038884ff995a456dcf93eb40b15cbb4523d0"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.15/selvage-linux-amd64.tar.gz"
      sha256 "74b6a882016277a30547d6602c8c2ea46391d96a55e95e92c86fedff2c79ddca"
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
