class Zsasa < Formula
  desc "Fast Solvent Accessible Surface Area (SASA) calculator"
  homepage "https://n283t.github.io/zsasa/"
  license "MIT"
  version "0.9.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/N283T/zsasa/releases/download/v#{version}/zsasa-#{version}-macos-aarch64"
      sha256 "19d727fb8d4e6c02908e8498339cc300d88ac4ebf9a44f1376af54ecaf1805f8"
    else
      url "https://github.com/N283T/zsasa/releases/download/v#{version}/zsasa-#{version}-macos-x86_64"
      sha256 "4fec4bb3d91a4cf7c6bf97f750850f3138c5bb189102c0347a0ff441aa661d90"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/N283T/zsasa/releases/download/v#{version}/zsasa-#{version}-linux-aarch64"
      sha256 "438c05e1dfc49b5ca149d3a754f31638e810e67111a25b5d5d24573b3d81b80a"
    else
      url "https://github.com/N283T/zsasa/releases/download/v#{version}/zsasa-#{version}-linux-x86_64"
      sha256 "aff46c7806519f12bf45277e177d545bf0ce94d68959c2a7ba300c45fcbb7bc6"
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
