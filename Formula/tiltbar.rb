# Homebrew Formula for TiltBar
#
# This file is a template. Once the first release is created:
# 1. Create a new repository: https://github.com/seriousben/homebrew-tiltbar
# 2. Copy this file to: Formula/tiltbar.rb in that repository
# 3. Update the url and sha256 with actual release values
# 4. Push to the homebrew-tiltbar repository
#
# To get the sha256 after creating a release:
#   curl -sL https://github.com/seriousben/tilt-status-bar/archive/refs/tags/v0.1.0.tar.gz | shasum -a 256

class Tiltbar < Formula
  desc "macOS menu bar app that shows your Tilt resource status at a glance"
  homepage "https://github.com/seriousben/tilt-status-bar"
  url "https://github.com/seriousben/tilt-status-bar/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256"
  license "Apache-2.0"

  depends_on xcode: ["14.0", :build]
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
