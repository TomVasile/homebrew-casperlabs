class CasperlabsNode < Formula
  desc "Scala node for the CasperLabs platform."
  homepage "www.casperlabs.io"
  version "0.18.2"
  url "https://github.com/CasperLabs/CasperLabs/releases/download/v#{version}/casperlabs-node-#{version}.tgz"
  sha256 "a24dd80c1ad8b54febe5184332f0577c1acda1d2f1e38549b22f6d18a0c61e6c"

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
