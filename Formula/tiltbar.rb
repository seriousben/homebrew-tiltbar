# Homebrew Formula for TiltBar
#
# To get the sha256 after creating a release:
#   curl -sL https://github.com/seriousben/tiltbar/archive/refs/tags/v1.1.0.tar.gz | shasum -a 256

class Tiltbar < Formula
  desc "macOS menu bar app that shows your Tilt resource status at a glance"
  homepage "https://github.com/seriousben/tiltbar"
  url "https://github.com/seriousben/tiltbar/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "b2ffba2acd92b10cea32cf2b1fa312a75be48b0e53ad61e72c63f21f4c83b307"
  license "Apache-2.0"

  depends_on :macos => :ventura

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/TiltBar" => "tiltbar"
  end

  def caveats
    <<~EOS
      TiltBar is a menu bar application. To run it:
        tiltbar

      Make sure Tilt is installed and running:
        brew install tilt
        tilt up

      For more information, visit:
        https://github.com/seriousben/tiltbar
    EOS
  end

  test do
    # Test that the binary exists and is executable
    assert_predicate bin/"tiltbar", :exist?
    assert_predicate bin/"tiltbar", :executable?
  end
end
