class TrussCli < Formula
  desc "CLI to help manage many k8s clusters"
  homepage "https://github.com/instructure-bridge/truss-cli"
  version "0.0.7"

  depends_on "kubectl"
  depends_on "vault"
  depends_on "sshuttle"

  def self.go_os
    OS.mac? ? :Darwin : :Linux
  end

  def self.go_arch
    ::Hardware::CPU.arch
  end

  def self.basename
    "truss-cli_#{version}_#{go_os}_#{go_arch}.tar.gz"
  end

  url "https://github.com/instructure-bridge/truss-cli/releases/download/v#{version}/#{basename}"
  sha256({
    "truss-cli_0.0.7_Linux_x86_64.tar.gz" => "47acac9a43016d7892e41ccf8444e17e8b4c41af8875b63fb13dac2cecf728ab",
    "truss-cli_0.0.7_Linux_i386.tar.gz" => "e4a2050956a5b98f812b4dfc32ba6a93fb200ffeb6155a8eb24f23fcd914d837",
    "truss-cli_0.0.7_Darwin_i386.tar.gz" => "33f488bdf8b00c706384da901c89aa8cdbb3342aaa15feca62848026ff2c1ac7",
    "truss-cli_0.0.7_Darwin_x86_64.tar.gz" => "06f905fede80ec5d4b35036b4849fad3cef7f17396191c6c8207e303d98e00ca",
  }[basename])

  def install
    system "cp", "truss-cli", "truss"
    bin.install "truss"
  end

  test do
    system bin/"truss", "help"
  end
end
