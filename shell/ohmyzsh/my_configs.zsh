## ENV
export PATH=$HOME/.local/bin:$PATH

export JAVA_HOME=$(/usr/libexec/java_home)

# brewhome bottle
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

# zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=15'

#aliases
alias cls=clear
alias rmd="rm -rf"
alias npmgls="npm list -g --depth 0"
alias npmclean="npm cache clean --force"
alias pipls="pip list"
alias pipout="pip list --outdated"
alias eczsh="ec ~/.zshrc"
