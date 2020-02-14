class CasperlabsEngine < Formula
  desc "Rust engine for the CasperLabs platform."
  homepage "www.casperlabs.io"
  version "0.14.0"
  url "https://github.com/CasperLabs/CasperLabs/releases/download/v#{version}/casperlabs-engine-grpc-server-#{version}_darwin_i386.tar.gz"
  sha256 "4268196770cc886d9913b0523fa4c16b3406cdc18a3e61ea91989e3b4f6ba07f"

  JAVA_VERSION = "1.10+"

  depends_on :java => JAVA_VERSION
  depends_on "libsodium"

  def install
    libexec.mkpath
    libexec.install "casperlabs-engine-grpc-server"
    bin.write_exec_script "#{libexec}/casperlabs-engine-grpc-server"
  end

  test do
    system shell_output("#{bin}/casperlabs-engine-grpc-server --version").include?(version).to_s
  end
end
