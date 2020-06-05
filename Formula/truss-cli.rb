class TrussCli < Formula
  desc "CLI to help manage many k8s clusters"
  homepage "https://github.com/instructure-bridge/truss-cli"
  version "0.0.6"

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
    "truss-cli_0.0.6_Linux_x86_64.tar.gz" => "2ad20af8b9ee40f961ea08065b510ac1e004842a15eb06d680e84de652c0dcfc",
    "truss-cli_0.0.6_Linux_i386.tar.gz" => "1c8018856ea52823ab1f946a1e0add058269b01faac6d9273110a716ca81ce78",
    "truss-cli_0.0.6_Darwin_i386.tar.gz" => "b6706449b9dc8773597fb720cff412ce163d58365e55db5cd61cff940a8b1621",
    "truss-cli_0.0.6_Darwin_x86_64.tar.gz" => "8dcf848fa3a18f585b54a9e870023d4decf20095d96b7d0983b14adf65ee6ef1",
  }[basename])

  def install
    system "cp", "truss-cli", "truss"
    bin.install "truss"
  end

  test do
    system bin/"truss", "help"
  end
end
