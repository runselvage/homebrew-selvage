class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.30/selvage-darwin-arm64.tar.gz"
      sha256 "e24e9aceb1b3009db5aa3b01f5c1213a2de9cfa128babb0500e81f8701fda96f"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.30/selvage-darwin-amd64.tar.gz"
      sha256 "e97d2981cae9bf1e6f455b7e61a5cc121c17b6a8fc728452bb411b4b30457ef1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.30/selvage-linux-arm64.tar.gz"
      sha256 "1eda6710ed84256a3104cabd2dd38d6d5f357e3410d8105012dce387c1670327"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.30/selvage-linux-amd64.tar.gz"
      sha256 "5722f873a564907786f37203d65b35d95a553a6248e0994850a68343378056aa"
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
