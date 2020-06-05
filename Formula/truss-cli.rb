class TrussCli < Formula
  desc "CLI to help manage many k8s clusters"
  homepage "https://github.com/instructure-bridge/truss-cli"
  version "0.0.4"

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
    "truss-cli_0.0.4_Linux_x86_64.tar.gz" => "54dce1199f05d745a4f053ad6f3c39ec0f79cc0199cb333dff47b28c3e23d4c2",
    "truss-cli_0.0.4_Linux_i386.tar.gz" => "20dda695696a70064de969a25f2f9378b60e4a780239e3fe1973fdc3dfb9a053",
    "truss-cli_0.0.4_Darwin_i386.tar.gz" => "c883f5b05770420e9c12969fc1c4cb94e8d7eb22ed674711af8f7273a268491a",
    "truss-cli_0.0.4_Darwin_x86_64.tar.gz" => "d49806356c18d93ae421ccf5308aa9f557ff76b571c39e28ec5ddb040ef21f53",
  }[basename])

  def install
    system "cp", "truss-cli", "truss"
    bin.install "truss"
  end

  test do
    system bin/"truss", "help"
  end
end
