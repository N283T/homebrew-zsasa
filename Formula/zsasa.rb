class Zsasa < Formula
  desc "Fast Solvent Accessible Surface Area (SASA) calculator"
  homepage "https://n283t.github.io/zsasa/"
  license "MIT"
  version "0.3.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/N283T/zsasa/releases/download/v#{version}/zsasa-#{version}-macos-aarch64"
      sha256 "652a8220871a933701a333676b13f414f336220b8de8b234f159cc8497f1254d"
    else
      url "https://github.com/N283T/zsasa/releases/download/v#{version}/zsasa-#{version}-macos-x86_64"
      sha256 "435264834e70d0aafefae48ce5cbfbd440a25ad915304bbb8506cf9f3ed86c7d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/N283T/zsasa/releases/download/v#{version}/zsasa-#{version}-linux-aarch64"
      sha256 "359faf8fd9e3c529e13d2d9d9e18f4ad493ce61c99fac06990886bf9cfae63c4"
    else
      url "https://github.com/N283T/zsasa/releases/download/v#{version}/zsasa-#{version}-linux-x86_64"
      sha256 "df9b8218ae717e508d24ceda3b9bcbc10e29b9674b8d039d74b9a302e643777c"
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
