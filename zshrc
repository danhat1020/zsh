export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="$HOME/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

eval $(oh-my-posh init zsh --config "~/.config/zsh/plugins/oh-my-posh/zen.toml")

bindkey -v
export KEYTIMEOUT=1

if [[ -z $TMUX ]]; then
    bindkey -s "^F" "tmux-session.sh\n"
fi

# User configuration

# aliases
alias ls="eza -a --oneline --show-symlinks --color=always --icons=always --sort=name --git-ignore --group-directories-first"
alias tree="eza -a --tree --git-ignore"
# alias icat="kitten icat"
alias showcolor="curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/e50a28ec54188d2413518788de6c6367ffcea4f7/print256colours.sh | zsh"
alias rm="rm -rf"
alias vim="nvim"
alias bonsai="cbonsai --live --time=0.015 --infinite --wait=1.00 --leaf=\?,\&,\$ --color=2,130,77,3 --multiplier=8 --life=60"
alias matrix="cmatrix -bk"
alias gamma="pkill wl-gammarelay && hyprctl dispatch exec wl-gammarelay"

mkcd() {
    if [ -z "$1" ]; then
        echo "Usage: mkcd <directory_name>"
        return 1
    fi
    mkdir -p "$1" && cd "$1"
}

rmcd() {
    local current_dir
    current_dir=$(basename "$PWD")
    cd .. || return 1
    rm -rf "$current_dir"
}

# skim setup
if [[ -r /usr/share/skim/key-bindings.zsh ]]; then
  source /usr/share/skim/key-bindings.zsh
fi

if [[ -r /usr/share/skim/completion.zsh ]]; then
  source /usr/share/skim/completion.zsh
fi

FILE_PREFIX="~/"
export SKIM_DEFAULT_COMMAND='fd . --type f --type d --hidden --follow --exclude .git ~ | sed "s|^$HOME/|$FILE_PREFIX|"'
export SKIM_CTRL_T_COMMAND='fd . --type f --hidden --follow --exclude .git ~ | sed "s|^$HOME/|$FILE_PREFIX|"'
export SKIM_ALT_C_COMMAND='fd . --type d --hidden --follow --exclude .git ~ | sed "s|^$HOME/|$FILE_PREFIX|"'
export SKIM_DEFAULT_OPTIONS='--color bw --ansi --reverse --prompt="λ "'

source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

echo ""
