class TrussCli < Formula
  desc "CLI to help manage many k8s clusters"
  homepage "https://github.com/instructure-bridge/truss-cli"
  version "0.0.5"

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
    "truss-cli_0.0.5_Linux_x86_64.tar.gz" => "1e74aec6c423a171afb6b47d89db74953cd5f6312621474cf7097151b0c6fbce",
    "truss-cli_0.0.5_Linux_i386.tar.gz" => "4eab713b7d2df3436e472eb8c7193c9da6c7cb772544c0594ca507a69be7a38c",
    "truss-cli_0.0.5_Darwin_i386.tar.gz" => "8ae8c44ae7fc7b0bc6dfe2df134965d41c4d94ede7763c6b7a599830a095a0ec",
    "truss-cli_0.0.5_Darwin_x86_64.tar.gz" => "c757d67522634c84f12d6a6faadd742679d7c56dfb39e6d8fa16a666e2544f2f",
  }[basename])

  def install
    system "cp", "truss-cli", "truss"
    bin.install "truss"
  end

  test do
    system bin/"truss", "help"
  end
end
