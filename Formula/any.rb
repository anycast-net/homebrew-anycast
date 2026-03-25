class Any < Formula
  desc "Anycast Connect — expose local services to the Anycast mesh"
  homepage "https://anycast.com"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-darwin-arm64"
      sha256 "b6e60fcb34cb24ab2e2b91290df59d35900aa84f90da223ce36365e966ce9ddf"
    else
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-darwin-amd64"
      sha256 "f2331b27cd4c83f0a7ca4a68a20539d2f99a32fda1d1b6da3e5025e7f7e93ac1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-linux-arm64"
      sha256 "b5edf8440806f8d57ba5361f6779eef15ebc3adb6b0e51328cb1e57926469aad"
    else
      url "https://github.com/anycast-net/anycast-connect/releases/download/v#{version}/any-linux-amd64"
      sha256 "0fbc1705c8d27cbe7e3ce0bfe40ef0e476d475821369b9de0d7856cc608dd651"
    end
  end

  def install
    bin.install Dir["any-*"].first => "any"
  end

  test do
    assert_match "any", shell_output("#{bin}/any version")
  end
end
