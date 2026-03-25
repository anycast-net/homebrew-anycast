class Any < Formula
  desc "Anycast Connect — expose local services to the Anycast mesh"
  homepage "https://anycast.com"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-darwin-arm64"
      sha256 "e2f7c687c710ef80bf5feace47814764cf23d0a790308cf2a6422625e045b21b"
    else
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-darwin-amd64"
      sha256 "ec8b1550d92db7da7c8673d81fcc59390ce7834f5a4c8f6b4614dbf7b98ecaed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-linux-arm64"
      sha256 "03b934b5db89dbfbc6efcc79d7cf544c65d4d0733c97f94a1a9056c7c964968d"
    else
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-linux-amd64"
      sha256 "65589a2a590a05d7538ffe4609d673fe9a2d8577e55c3487f6c2e283ebd44e66"
    end
  end

  def install
    bin.install Dir["any-*"].first => "any"
  end

  test do
    assert_match "any", shell_output("#{bin}/any version")
  end
end
