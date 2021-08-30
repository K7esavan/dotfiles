alias tmux "tmux -u "
alias neovim "cd ~/.config/nvim/init.vim"
alias ls "exa -l -g --icons --group-directories-first"
#alias ll "exa --icons -al --color=always --group-directories-first"
alias ll "exa -l -g --icons"
alias tree "exa --icons --tree --level=2 -a"
alias nvim "/home/code/.config/nvim/nvim.appimage"
alias nv "/home/code/.config/nvim/nvim.appimage"
alias cls "clear"
alias la "exa --group-directories-first"
alias more "batcat"
alias pip "pip3"
alias python "python3"
alias cat "batcat"
alias gt-a "git add *"
alias gt-c "git commit -m \"same commited message because it's a script\""
alias gt-p "gt-a; gt-c; git push origin main"
alias extract "tar -xvzf"

set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
#alias g git
#command -qv nvim && alias vim nvim

#set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH
