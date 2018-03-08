class OhMyMustache < Formula
  desc "Templating with Mustache"
  homepage "https://github.com/ekino/oh-my-mustache"
  url "https://github.com/ekino/oh-my-mustache/releases/download/1.0.0/oh-my-mustache-1.0.0.zip"
  sha256 "c1f5f98e72005ba2ab09113a529dbf27b8092d6c82605e272706434c52eda487"
  head "https://github.com/ekino/oh-my-mustache"

  depends_on "bash-completion" => :recommended

  def install
    libexec.install "bin"
    libexec.install "lib"
    bin.install_symlink "#{libexec}/bin/oh-my-mustache" => "oh-my-mustache"

    bash_completion.install "completion/ohmymustache-completion.bash"
  end

  def caveats; <<~EOS
    To use completion, add the following line to your ~/.bash_profile or ~/.zshrc:
      [ -f #{etc}/bash_completion.d/ohmymustache-completion.bash ] && source #{etc}/bash_completion.d/ohmymustache-completion.bash

    /!\\ ZSH users : you may need to add these two lines before the previous one
      autoload -U compinit && compinit
      autoload -U bashcompinit && bashcompinit
    EOS
  end

  test do
    system bin/"oh-my-mustache", "-t", "Hi {{name}} !", "-v", "name", "brew user"
  end
end
