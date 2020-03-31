class CasperlabsNode < Formula
  desc "Scala node for the CasperLabs platform."
  homepage "www.casperlabs.io"
  version "0.17.0"
  url "https://github.com/CasperLabs/CasperLabs/releases/download/v#{version}/casperlabs-node-#{version}.tgz"
  sha256 "c8d8974b1d8efb2fd658bd1876c1e1f21295a927314306b627905cfa94fdc07d"

  JAVA_VERSION = "1.10+"

  depends_on :java => JAVA_VERSION
  depends_on "libsodium"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.mkpath
    libexec.install %w[bin lib]
    (bin/"casperlabs-node").write_env_script "#{libexec}/bin/casperlabs-node", "JAVA_HOME" => "$(#{Language::Java.java_home_cmd(JAVA_VERSION)})"
  end

  test do
    system shell_output("#{bin}/casperlabs-node --version").include?(version).to_s
  end
end
