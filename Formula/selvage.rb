class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent
  version "0.2.33"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.33/selvage-darwin-arm64.tar.gz"
      sha256 "0a5669077936e07e388b2f5f01c0d7d8f673d04fdf9c79bcd24cca7aeacf4e55"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.33/selvage-darwin-amd64.tar.gz"
      sha256 "d5f01edebb57611e7536140fe0072cd9fc555031809f9ba91d162940f6e812a6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.33/selvage-linux-arm64.tar.gz"
      sha256 "958992750fb2955bb1792878b60efe3b508978f39830399aecb9d53d4a05eb13"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.33/selvage-linux-amd64.tar.gz"
      sha256 "008c91098989f78502b548699582b76a3fb6584e24a127445480a1fbbe173ab4"
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
