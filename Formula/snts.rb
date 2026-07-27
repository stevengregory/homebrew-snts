# typed: false
# frozen_string_literal: true

class Snts < Formula
  desc "TypeScript CLI utility for ServiceNow developers using VS Code"
  homepage "https://github.com/stevengregory/sn-typescript-util"
  url "https://registry.npmjs.org/sn-typescript-util/-/sn-typescript-util-1.6.5.tgz"
  sha256 "1db882a58b9f486ad2c90851feaa4e7144d570d662c1e88589d47d5ec7230e66"
  license "MIT"

  livecheck do
    url "https://registry.npmjs.org/sn-typescript-util/latest"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on "node"

  uses_from_macos "rsync"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/snts --version")
    assert_match "Build project utility files", shell_output("#{bin}/snts --help")
  end
end
