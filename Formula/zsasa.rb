class Zsasa < Formula
  desc "Fast Solvent Accessible Surface Area (SASA) calculator"
  homepage "https://n283t.github.io/zsasa/"
  license "MIT"
  version "0.2.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/N283T/zsasa/releases/download/v#{version}/zsasa-#{version}-macos-aarch64"
      sha256 "e0c9381b15952d4cc3b68046f5521d0d426b53ce82efad9afa5d736d55fce3dc"
    else
      url "https://github.com/N283T/zsasa/releases/download/v#{version}/zsasa-#{version}-macos-x86_64"
      sha256 "4180352b71ff4f3b4a413ad996a54d67a54bc32af4eb7cb574dbcbfaa3e3558a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/N283T/zsasa/releases/download/v#{version}/zsasa-#{version}-linux-aarch64"
      sha256 "05caa1ec92745bb1141d55bc856f47f1f7d2ab6459c49c1cd33dd6c633ad8d3d"
    else
      url "https://github.com/N283T/zsasa/releases/download/v#{version}/zsasa-#{version}-linux-x86_64"
      sha256 "e81202bd04b207ef9817948bbbd0ea3d4351db18a35d03b9aaa8fee3016d4540"
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
