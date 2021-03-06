class Geomview < Formula
  desc "Interactive 3D viewing program"
  homepage "http://www.geomview.org"
  url "https://deb.debian.org/debian/pool/main/g/geomview/geomview_1.9.5.orig.tar.gz"
  mirror "https://downloads.sourceforge.net/project/geomview/geomview/1.9.5/geomview-1.9.5.tar.gz"
  sha256 "67edb3005a22ed2bf06f0790303ee3f523011ba069c10db8aef263ac1a1b02c0"
  license "LGPL-2.1-only"
  revision 2

  livecheck do
    url "https://deb.debian.org/debian/pool/main/g/geomview/"
    regex(/href=.*?geomview[._-]v?(\d+(?:\.\d+)+)(?:\.orig)?\.t/i)
  end

  bottle do
    sha256 "8fcdf484eb6699c2f4c5bc46dec876ba9b4439d39a2dcc6342f63eec019decf4" => :catalina
    sha256 "ff34b05281e51f09386f1c1ae150ec0fee0d1c8c7afe74a63fec22c7add9285c" => :mojave
    sha256 "8c92e54836c38a56cbb22a0488dab7665d11fd44d918956a899bb4ef2175d338" => :high_sierra
  end

  depends_on "libice"
  depends_on "libsm"
  depends_on "libx11"
  depends_on "libxext"
  depends_on "libxmu"
  depends_on "libxt"
  depends_on "mesa"
  depends_on "mesa-glu"
  depends_on "openmotif"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
    (bin/"hvectext").unlink
  end

  test do
    assert_match "Error: Can't open display:", shell_output("DISPLAY= #{bin}/geomview 2>&1", 1)
  end
end
