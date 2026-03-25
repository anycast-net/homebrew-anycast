class Any < Formula
  desc "Anycast Connect — expose local services to the Anycast mesh"
  homepage "https://anycast.com"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-darwin-arm64"
      sha256 "b7dd0f187eb9e53bb392face163864a39fc176801ffaa15b5cd63a25005dfd03"
    else
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-darwin-amd64"
      sha256 "3aa50e1625c9e2f4b1d684dd4d79873190b266ee7814ef1a4ac0bea8d6c3b549"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-linux-arm64"
      sha256 "eaacec080289179bcd415d2ad0c4277e42303875af59dfa7a5e1a6b2af4f87b5"
    else
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-linux-amd64"
      sha256 "b949236b4e7987a15e678a41d12ea7b1f323dba5fa6dedb6f512906d49d71304"
    end
  end

  def install
    bin.install Dir["any-*"].first => "any"
  end

  test do
    assert_match "any", shell_output("#{bin}/any version")
  end
end
