# ZSH Config

**Steps to replicate:**
1. Move ~/.zshrc file to .config/zsh/zshrc
2. Create new ~/.zshrc
3. Write:
```
if [ -r ~/.config/zsh/zshrc ]; then
  source ~/.config/zsh/zshrc
fi
```
