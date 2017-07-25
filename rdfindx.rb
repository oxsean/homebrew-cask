class Rdfindx < Formula
  desc "Find duplicate files based on content (NOT file names)"
  homepage "https://github.com/oxsean/rdfind"
  url "https://github.com/oxsean/rdfind/archive/1.3.5.tar.gz"
  sha256 "6f5a9e4a32eb6dd44e74452e05198b6e4fae325c5923710ab060a9316b20c385"
  revision 2

  bottle do
    cellar :any
    sha256 "4531928ed8d78b25d6a8d403ca81d8c2b8ddc59a884ab45dfa16d0c0be553c8d" => :sierra
    sha256 "37fd65e7eb7f130794dcf334e3f765af8213d711889a854d67dfa01950343bad" => :el_capitan
    sha256 "369d6dd1f73c0af431ad7a5babe40ea08cb9906f56d6dde20e16e72f9f2d5b14" => :yosemite
    sha256 "57fe67783383110ec6c954fc605541ae7095ea1e39a4ef5c75a00d9e95395a51" => :mavericks
  end

  depends_on "nettle"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    mkdir "folder"
    touch "folder/file1"
    touch "folder/file2"
    system "#{bin}/rdfind", "-deleteduplicates", "true", "-ignoreempty", "false", "folder"
    assert File.exist?("folder/file1")
    assert !File.exist?("folder/file2")
  end
end

