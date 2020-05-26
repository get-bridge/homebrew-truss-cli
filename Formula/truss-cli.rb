class TrussCli < Formula
  desc "CLI to help manage many k8s clusters"
  homepage "https://github.com/instructure-bridge/truss-cli"
  version "0.0.3"

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
    "truss-cli_0.0.3_Linux_x86_64.tar.gz" => "5d61d8dfba0c2b7d64f4aa429169810d0bdacffbc781cadd8c6d31ea0b17e048",
    "truss-cli_0.0.3_Linux_i386.tar.gz" => "87140c3bd20a40e76a3882e824aa494c0f6799e762c24cec20bdb4ddd7ee9555",
    "truss-cli_0.0.3_Darwin_i386.tar.gz" => "3deee82d876bf1a59f0b8ec9bfbcfdc058c1a553404c82540d9ce224068bb648",
    "truss-cli_0.0.3_Darwin_x86_64.tar.gz" => "ef47deafb501a82c6c71b5c74e1f95c9177f673acc8473594b30cbb0701a5ded",
  }[basename])

  def install
    system "cp", "truss-cli", "truss"
    bin.install "truss"
  end

  test do
    system bin/"truss", "help"
  end
end
