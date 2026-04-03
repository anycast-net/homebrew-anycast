class Any < Formula
  desc "Anycast Connect — expose local services to the Anycast mesh"
  homepage "https://anycast.com"
  version "0.1.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-darwin-arm64"
      sha256 "1ec5b4b1d4cff9702cd57c7e2704fcd3870dcee955ea68d6503f92e12f480956"
    else
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-darwin-amd64"
      sha256 "9f31cff5df4bc8f04f1f2af4ee710e802163bd962d5b01d0d4664b9fe100df08"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-linux-arm64"
      sha256 "49dc8b0cd313abd1b3816d42c469d8d995f187279703bb52a38fa683c013bfe8"
    else
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-linux-amd64"
      sha256 "078c9282a86ec3b3bba71327275ee9927de6557e349003231c8a79a56ae2afbc"
    end
  end

  def install
    bin.install Dir["any-*"].first => "any"
  end

  test do
    assert_match "any", shell_output("#{bin}/any version")
  end
end
