class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.22/selvage-darwin-arm64.tar.gz"
      sha256 "1794620e20be9597422132f2d8b340dc50bb64aa746195ca2ab8efc4c11fbd2b"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.22/selvage-darwin-amd64.tar.gz"
      sha256 "25614394efbb327405d32a7c1d1b09ec98b09f4cf79bbbd71fa9142124af406d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.22/selvage-linux-arm64.tar.gz"
      sha256 "ae98c0072e2928436eb573d134c4366463a396c665a6bc58a2c884eadacfcc9c"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.22/selvage-linux-amd64.tar.gz"
      sha256 "25cef6c7eefdba61172774faa74c67165244928e02e774f2f0c626a81a1e4dba"
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
