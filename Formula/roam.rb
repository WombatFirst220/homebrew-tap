class Roam < Formula
  desc "Work on the same projects from several Macs, always in sync"
  homepage "https://github.com/WombatFirst220/roam"
  url "https://github.com/WombatFirst220/roam/archive/refs/tags/v1.9.0.tar.gz"
  sha256 "2e066f9872c088f2954b7edfc89060981d7f9517224e771a8d90c90d1c7433c4"
  license "MIT"

  depends_on :macos
  depends_on "age"   # secrets travel encrypted (roam: key e) — installed and upgraded along with roam

  def install
    libexec.install "roam", "lib"
    bin.install_symlink libexec/"roam"
  end

  def caveats
    <<~EOS
      Set up this Mac (once per Mac):
        roam setup
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/roam version")
  end
end
