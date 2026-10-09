class Roam < Formula
  desc "Work on the same projects from several Macs, always in sync"
  homepage "https://github.com/WombatFirst220/roam"
  url "https://github.com/WombatFirst220/roam/archive/refs/tags/v1.9.1.tar.gz"
  sha256 "3ff95a011dee96b9db48bfff4274ec74a6b9d940b65d0eef9996a25f1549adfa"
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
