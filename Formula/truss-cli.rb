class TrussCli < Formula
  desc "CLI to help manage many k8s clusters"
  homepage "https://github.com/instructure/truss-cli"
  version "0.0.1"

  # depends_on "kubectl"
  # depends_on "vault"
  # depends_on "sshuttle"

  def self.go_os
    OS.mac? ? :Darwin : :Linux
  end

  def self.go_arch
    OS.mac? ? ::MacOS.preferred_arch.to_s : `arch`.chomp
  end

  def self.basename
    "truss-cli_#{version}_#{go_os}_#{go_arch}.tar.gz"
  end

  url "https://github.com/instructure/truss-cli/releases/download/v#{version}/#{basename}"
  sha256({
    "truss-cli_0.0.1_Linux_x86_64.tar.gz" => "de7bcfdd546404febf8efe90ad8fc9765622d65d5e74148c67141987f63936c4",
    "truss-cli_0.0.1_Linux_i386.tar.gz" => "82cecede47c1341c521e98a196dca156d8246716249320fd38e97bb98bd6fd93",
    "truss-cli_0.0.1_Darwin_i386.tar.gz" => "b16b3eab971e6a7d079850de2d90f554cb75106fe110a1f03a4603fede730139",
    "truss-cli_0.0.1_Darwin_x86_64.tar.gz" => "159e5ed4f6ca9222de2bd27c8441db9878f7b238d3bccd2798e0724c4687305f",
  }[basename])

  def install
    bin.install "truss-cli"
  end

  test do
    system bin/"muss", "help"
  end
end