class CasperlabsClient < Formula
  desc "Scala client for the CasperLabs platform."
  homepage "www.casperlabs.io"
  version "0.9.1"
  url "https://github.com/CasperLabs/CasperLabs/releases/download/v#{version}/casperlabs-client-#{version}.tgz"
  sha256 "9c69fff3a0ee56b7bedd307e58f91268c976238525be2843b8c94cdb47258e47"

  JAVA_VERSION = "1.10+"

  depends_on :java => JAVA_VERSION
  depends_on "libsodium"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.mkpath
    libexec.install %w[bin lib]
    (bin/"casperlabs-client").write_env_script "#{libexec}/bin/casperlabs-client", "JAVA_HOME" => "$(#{Language::Java.java_home_cmd(JAVA_VERSION)})"
  end

  test do
    system shell_output("#{bin}/casperlabs-client --version").include?(version).to_s
  end
end
