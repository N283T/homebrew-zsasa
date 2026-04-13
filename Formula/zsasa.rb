class Zsasa < Formula
  desc "Fast Solvent Accessible Surface Area (SASA) calculator"
  homepage "https://n283t.github.io/zsasa/"
  license "MIT"
  version "0.2.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/N283T/zsasa/releases/download/v#{version}/zsasa-#{version}-macos-aarch64"
      sha256 "392f0f96ede7697f21a1781a0fd0ae0745ab28436afbbcee4385d8a7a44f5c1b"
    else
      url "https://github.com/N283T/zsasa/releases/download/v#{version}/zsasa-#{version}-macos-x86_64"
      sha256 "9491e4ca0338254f68e9d222445f6706638ff09e3a9d9b5491be2731c7c093d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/N283T/zsasa/releases/download/v#{version}/zsasa-#{version}-linux-aarch64"
      sha256 "021aedb246b7a1d75cc46e1dde52e6f59ee806317515ce0b3ba1fde03321b147"
    else
      url "https://github.com/N283T/zsasa/releases/download/v#{version}/zsasa-#{version}-linux-x86_64"
      sha256 "60317544c758922dcd71983987359a8f9f7cbdcdb0e7c4840ea3f1e6d5eb3848"
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
