class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.14/selvage-darwin-arm64.tar.gz"
      sha256 "b4f2b7dbaee587b3972e193fcdf23af32755170960330f2b070819d42553b59d"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.14/selvage-darwin-amd64.tar.gz"
      sha256 "07eb278191ae67a314a5ab46cd642f6c411941b41234aa639c6e55e1d4190cd3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.14/selvage-linux-arm64.tar.gz"
      sha256 "2959352daaed861567a02a3169305449303e5b56e6aada5c617fa39d8955f8e9"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.14/selvage-linux-amd64.tar.gz"
      sha256 "8204eadb1f54857a134d0d2f5a4ffbedaed15bca0512daaf4ffaa9834c8e2f40"
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
