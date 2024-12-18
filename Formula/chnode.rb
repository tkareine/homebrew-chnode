# frozen_string_literal: true

class Chnode < Formula
  desc "Changes shell's current Node.js"
  homepage "https://github.com/tkareine/chnode"
  url "https://github.com/tkareine/chnode/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "b79548a2c94678f448fe35aabcfb406c0c826bd3f830c1d1b54dba8e106c5121"
  license "MIT"
  head "https://github.com/tkareine/chnode.git", branch: "master"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  def caveats
    <<~DOC
      Add the following to ~/.bashrc or ~/.zshrc:

        source #{opt_share}/chnode/chnode.sh

      When the shell loads chnode.sh with the source command, the script
      auto-detects Node.js versions installed in the ~/.nodes directory.

      You may override the ~/.nodes directory by setting the CHNODE_NODES_DIR
      shell variable to point to another directory. Do this before executing
      the source command. For example:

        CHNODE_NODES_DIR=/opt/nodes
        source #{opt_share}/chnode/chnode.sh

      For documentation, see:

        * #{opt_share}/doc/chnode/README.md
        * #{homepage}
    DOC
  end

  test do
    mkdir_p ".nodes/node-10.11.0/bin"
    touch ".nodes/node-10.11.0/bin/node"
    chmod "a+x", ".nodes/node-10.11.0/bin/node"
    actual_output = shell_output(<<~DOC).strip
      bash -c '\
        CHNODE_NODES_DIR=#{testpath}/.nodes; \
        source #{opt_share}/chnode/chnode.sh && chnode \
      '
    DOC
    assert_equal "node-10.11.0", actual_output
  end
end
