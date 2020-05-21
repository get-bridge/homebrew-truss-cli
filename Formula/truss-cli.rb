class TrussCli < Formula
  desc "CLI to help manage many k8s clusters"
  homepage "https://github.com/instructure/truss-cli"
  version "0.0.2"

  depends_on "kubectl"
  depends_on "vault"
  depends_on "sshuttle"

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
    "truss-cli_0.0.2_Linux_x86_64.tar.gz" => "8880d344840c6268a55ee3f03062fe8cfacdb6da98b2eecff8d2931307cf68a8",
    "truss-cli_0.0.2_Linux_i386.tar.gz" => "e5676f3c30790935da306f9d4f04619b64fdb662b4225bacc1e982dc014537c4",
    "truss-cli_0.0.2_Darwin_i386.tar.gz" => "8653c9641456d369e9a0963d201c252651627d970abe9f3aee6b5f4052c8cc12",
    "truss-cli_0.0.2_Darwin_x86_64.tar.gz" => "ce4c69cd722b2934f9de85b2ab62fda28364ad715d6734021a3574071ea1694c",
  }[basename])

  def install
    system "cp", "truss-cli", "truss"
    bin.install "truss"
  end

  test do
    system bin/"truss", "help"
  end
end