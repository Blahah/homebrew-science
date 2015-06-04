class Salmon < Formula
  homepage "http://salmon.readthedocs.org/en/latest/"
  # tag "bioinformatics"

  url "https://github.com/COMBINE-lab/salmon/archive/v0.4.0.tar.gz"
  sha1 "3552ab0e8bb85be56b12f1b34356daaf48a43469"
  head "https://github.com/COMBINE-lab/salmon.git", :branch => "master"

  # See https://github.com/kingsfordgroup/sailfish/issues/74
  needs :cxx11

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "tbb"

  def install
    # Fix error: Unable to find the requested Boost libraries.
    ENV.deparallelize

    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "#{bin}/salmon", "--version"
  end
end
