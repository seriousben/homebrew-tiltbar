# Homebrew Formula for TiltBar
#
# To get the sha256 after creating a release:
#   curl -sL https://github.com/seriousben/tilt-status-bar/archive/refs/tags/v1.1.0.tar.gz | shasum -a 256

class Tiltbar < Formula
  desc "macOS menu bar app that shows your Tilt resource status at a glance"
  homepage "https://github.com/seriousben/tilt-status-bar"
  url "https://github.com/seriousben/tilt-status-bar/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
        https://github.com/seriousben/tilt-status-bar
    EOS
  end

  test do
    # Test that the binary exists and is executable
    assert_predicate bin/"tiltbar", :exist?
    assert_predicate bin/"tiltbar", :executable?
  end
end
