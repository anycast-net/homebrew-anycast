class Any < Formula
  desc "Anycast Connect — expose local services to the Anycast mesh"
  homepage "https://anycast.com"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-darwin-arm64"
      sha256 "476c265d67c7e4a49872746a9a2d1b7561ee8dac4d407d4efbe9d70668755169"
    else
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-darwin-amd64"
      sha256 "409d22a4e77b4cb6d85e7f3882ecac72ecbffe205df5cf98a66361d2ad65bac4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-linux-arm64"
      sha256 "43b025e0a456977a4da3083501db6b8ee9bb8b4df00329baed4541f7734e18dc"
    else
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-linux-amd64"
      sha256 "16f5135fa715ed9d5df5e5a9df2617eb2672acd407b34f024bcf047abfd3cef8"
    end
  end

  def install
    bin.install Dir["any-*"].first => "any"
  end

  test do
    assert_match "any", shell_output("#{bin}/any version")
  end
end
