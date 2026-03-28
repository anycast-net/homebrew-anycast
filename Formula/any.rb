class Any < Formula
  desc "Anycast Connect — expose local services to the Anycast mesh"
  homepage "https://anycast.com"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-darwin-arm64"
      sha256 "8ea4c13738ad063197b78b385d2255e5aa8f4194f0ec541cb092101facb2c39f"
    else
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-darwin-amd64"
      sha256 "13d06ae75d02bcc9f6bb2e0bac02e2783828e693f99f906303505ada50700807"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-linux-arm64"
      sha256 "c97b77f887b02bc69cbbc227a74f92cc9455104ad606795336b2c372e5806c1d"
    else
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-linux-amd64"
      sha256 "9fdd1dc7c9cc8537e59650bf4fe307878b6673ab9632a9dd03294e5f58af7be3"
    end
  end

  def install
    bin.install Dir["any-*"].first => "any"
  end

  test do
    assert_match "any", shell_output("#{bin}/any version")
  end
end
