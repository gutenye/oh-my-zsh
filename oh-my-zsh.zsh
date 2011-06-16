# Initializes OH MY ZSH.

fpath=($ZSH/test $ZSH/local/completion /$fpath)

# test environment
for file ($ZSH/test/*.zsh) source $file

# Disable color in dumb terminals.
if [[ "$TERM" == 'dumb' ]]; then
  DISABLE_COLOR='true'
fi

# Load all files in $ZSH/oh-my-zsh/lib/ that end in .zsh.
for file ($ZSH/lib/*.zsh) source $file

# Add all defined plugins to fpath.
plugin=${plugin:=()}
for plugin ($plugins) fpath=($ZSH/plugins/$plugin $fpath)

# Load and run compinit.
autoload -U compinit
compinit -i

# Load all plugins defined in ~/.zshrc.
for plugin in $plugins; do
	if [[ -f "$ZSH/plugins/$plugin/$plugin.plugin.zsh" ]]; then
		source "$ZSH/plugins/$plugin/$plugin.plugin.zsh"
	fi
done

# Load all of your local configurations from local/
for file ($ZSH/local/*.zsh) source "$file"

# Load the theme.
if [[ "$ZSH_THEME" == "random" ]]; then
  themes=($ZSH/themes/*.zsh-theme)
  theme_index=${#themes[@]}
  (( theme_index=((RANDOM % theme_index) + 1) ))
  random_theme="${themes[$theme_index]}"
  source "$random_theme"
else
  source "$ZSH/themes/$ZSH_THEME.zsh-theme"
fi

# Compile zcompdump, if modified, to increase startup speed.
if [[ "$HOME/.zcompdump" -nt "$HOME/.zcompdump.zwc" ]] || [[ ! -e "$HOME/.zcompdump.zwc" ]]; then
  zcompile "$HOME/.zcompdump"
fi
