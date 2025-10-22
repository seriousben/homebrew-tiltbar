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

    # Create .app bundle structure
    app_bundle = "#{buildpath}/TiltBar.app"
    contents = "#{app_bundle}/Contents"
    macos = "#{contents}/MacOS"
    resources = "#{contents}/Resources"

    mkdir_p macos
    mkdir_p resources

    # Copy executable
    cp ".build/release/TiltBar", "#{macos}/TiltBar"

    # Copy Info.plist
    cp "Sources/TiltBar/Resources/Info.plist", "#{contents}/Info.plist"

    # Copy icon resources
    cp_r Dir["Sources/TiltBar/Resources/*.png"], resources
    cp_r Dir["Sources/TiltBar/Resources/*.ico"], resources

    # Install to Applications
    prefix.install app_bundle
  end

  def caveats
    <<~EOS
      TiltBar has been installed to:
        #{prefix}/TiltBar.app

      To launch TiltBar:
        open #{prefix}/TiltBar.app

      Or search for "TiltBar" in Spotlight/Launchpad.

      TiltBar is a menu bar-only app and won't appear in the Dock.

      Make sure Tilt is installed and running:
        brew install tilt
        tilt up

      For more information, visit:
        https://github.com/seriousben/tiltbar
    EOS
  end

  test do
    # Test that the app bundle exists and is executable
    assert_predicate prefix/"TiltBar.app/Contents/MacOS/TiltBar", :exist?
    assert_predicate prefix/"TiltBar.app/Contents/MacOS/TiltBar", :executable?
  end
end
