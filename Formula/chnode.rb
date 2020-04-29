class Chnode < Formula
  desc "Changes shell's current Node.js"
  homepage "https://github.com/tkareine/chnode"
  url "https://github.com/tkareine/chnode/archive/v0.3.1.tar.gz"
  sha256 "aad8186cb803d8a7157f0d23113aeacac791adf63cec8180daa2693a8d30974e"
  head "https://github.com/tkareine/chnode.git"

  bottle :unneeded

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  def caveats
    <<~EOS
      Add the following to ~/.bashrc or ~/.zshrc:

        source #{opt_share}/chnode/chnode.sh

      When shell loads chnode with source command, the script auto-detects
      Node.js versions installed in ~/.nodes directory.

      You may override ~/.nodes directory by setting CHNODE_NODES_DIR shell
      variable to point to another directory. Do this before executing the
      source command. For example:

        CHNODE_NODES_DIR=/opt/nodes
        source #{opt_share}/chnode/chnode.sh

      For instructions, see:

        * #{opt_share}/doc/chnode/README.md
        * #{homepage}
    EOS
  end

  test do
    mkdir_p ".nodes/node-10.11.0/bin"
    touch ".nodes/node-10.11.0/bin/node"
    chmod "a+x", ".nodes/node-10.11.0/bin/node"
    actual_output = shell_output(<<~EOS).strip
      bash -c '\
        CHNODE_NODES_DIR=#{testpath}/.nodes; \
        source #{opt_share}/chnode/chnode.sh && chnode \
      '
    EOS
    assert_equal "node-10.11.0", actual_output
  end
end
