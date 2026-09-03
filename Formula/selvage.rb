class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.29/selvage-darwin-arm64.tar.gz"
      sha256 "e560391240c00dafbbfefd3d77dd79529ea7d389111620cb56248ec6419bb5d9"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.29/selvage-darwin-amd64.tar.gz"
      sha256 "c65bf5db14578a7486ae984300ba68f60fc1eacff1cb683a8606fa4086108612"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.29/selvage-linux-arm64.tar.gz"
      sha256 "cc79b1bad0f149e8ebf67bf7d5680093738726d63ad4585afdb7b4af07b480c7"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.29/selvage-linux-amd64.tar.gz"
      sha256 "4818487a84c492fc85888da5e09260d6623b69403777d168db6567e263298241"
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
