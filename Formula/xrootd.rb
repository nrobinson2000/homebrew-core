class Xrootd < Formula
  desc "High performance, scalable, fault-tolerant access to data"
  homepage "http://xrootd.org"
  url "http://xrootd.org/download/v4.8.2/xrootd-4.8.2.tar.gz"
  sha256 "8f28ec53e799d4aa55bd0cc4ab278d9762e0e57ac40a4b02af7fc53dcd1bef39"
  head "https://github.com/xrootd/xrootd.git"

  bottle do
    cellar :any
    sha256 "bd52bd5c1eb23dc62f59b3181b44de2188d25a11190d8b0cd22563ac1c2c6ae8" => :high_sierra
    sha256 "dea47c161b6d717525f5ff9fcfb395c287a8379cc74ba28db0de14071a9aed3d" => :sierra
    sha256 "5cd04eb4f45d29817b534a2d037b12784c7747e8582f399b4649632078be1dc5" => :el_capitan
  end

  depends_on "cmake" => :build
  depends_on "openssl"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system "#{bin}/xrootd", "-H"
  end
end
