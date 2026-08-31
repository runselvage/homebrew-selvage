class Selvage < Formula
  desc "Autonomous code implementation pipeline with multi-model review"
  homepage "https://selvage.run"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.25/selvage-darwin-arm64.tar.gz"
      sha256 "1183f96fc1ab29cbb1fc2a5224e480d633f579dfe44adc99295f657b20cec6ec"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.25/selvage-darwin-amd64.tar.gz"
      sha256 "229b5a3c9037b7064ed830aadb349eb4c6b50f1ee9227b0e6aeb457f066f815f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runselvage/selvage/releases/download/v0.2.25/selvage-linux-arm64.tar.gz"
      sha256 "5263a74aef0964074b1570b44be306059058bed06021b202180a512f9fb00b8c"
    else
      url "https://github.com/runselvage/selvage/releases/download/v0.2.25/selvage-linux-amd64.tar.gz"
      sha256 "f705628cc509e7f46bcbd17c60d5030d23a0f6af41f93962a96509ad90a997cd"
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
