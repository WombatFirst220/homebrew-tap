class Roam < Formula
  desc "Work on the same projects from several Macs, always in sync"
  homepage "https://github.com/WombatFirst220/roam"
  url "https://github.com/WombatFirst220/roam/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "2da87efb0dd346861c1247bf268acd3be8c20906afae20ff7fc5a75ccc733f22"
  license "MIT"

  depends_on :macos

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
