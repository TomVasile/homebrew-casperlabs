class CasperlabsEngine < Formula
  desc "Rust engine for the CasperLabs platform."
  homepage "www.casperlabs.io"
  version "0.18.2"
  url "https://github.com/CasperLabs/CasperLabs/releases/download/v#{version}/casperlabs-engine-grpc-server-#{version}_darwin_i386.tar.gz"
  sha256 "78536b21c71198926ae8031d7f727f742f7f134497565342ffc0ca309f81b729"

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
