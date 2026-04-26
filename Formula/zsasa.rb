class Zsasa < Formula
  desc "Fast Solvent Accessible Surface Area (SASA) calculator"
  homepage "https://n283t.github.io/zsasa/"
  license "MIT"
  version "0.2.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/N283T/zsasa/releases/download/v#{version}/zsasa-#{version}-macos-aarch64"
      sha256 "c19fdc8022b26828150004a00bb6d1ca1d0a3fc2794a7ca39e915f3b9e8be2b9"
    else
      url "https://github.com/N283T/zsasa/releases/download/v#{version}/zsasa-#{version}-macos-x86_64"
      sha256 "4748a0c2b10760147ab5b8c7a28447f5e7c69d00e0c2c961f64c9c4c5dd2e678"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/N283T/zsasa/releases/download/v#{version}/zsasa-#{version}-linux-aarch64"
      sha256 "bcaec9d95e0e46cefde70ef924dd852098518cfad4aa4d6c7da8548ad4d5842b"
    else
      url "https://github.com/N283T/zsasa/releases/download/v#{version}/zsasa-#{version}-linux-x86_64"
      sha256 "d43bdfbae8ab35667d4bc90e9b7eead634fd03879890b5e1122a301b77d758ac"
    end
  end

  def install
    binary_name = "zsasa-#{version}-#{OS.mac? ? "macos" : "linux"}-#{Hardware::CPU.arm? ? "aarch64" : "x86_64"}"
    bin.install binary_name => "zsasa"
  end

  test do
    assert_match "zsasa", shell_output("#{bin}/zsasa --version 2>&1")
  end
end
