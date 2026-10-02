class Roam < Formula
  desc "Work on the same projects from several Macs, always in sync"
  homepage "https://github.com/WombatFirst220/roam"
  url "https://github.com/WombatFirst220/roam/archive/refs/tags/v1.1.3.tar.gz"
  sha256 "8ca3216162c9c8a4042db570299b6585047099d2753bf5f2ae9555726a98ead7"
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
