#!/usr/bin/env zsh

# Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES

# unknown-token - unknown tokens / errors
# reserved-word - shell reserved words (if, for)
# alias - aliases
# suffix-alias - suffix aliases (requires zsh 5.1.1 or newer)
# builtin - shell builtin commands (shift, pwd, zstyle)
# function - function names
# command - command names
# precommand - precommand modifiers (e.g., noglob, builtin)
# commandseparator - command separation tokens (;, &&)
# hashed-command - hashed commands
# path - existing filenames
# path_pathseparator - path separators in filenames (/); if unset, path is used (default)
# path_prefix - prefixes of existing filenames
# path_prefix_pathseparator - path separators in prefixes of existing filenames (/); if unset, path_prefix is used (default)
# globbing - globbing expressions (*.txt)
# history-expansion - history expansion expressions (!foo and ^foo^bar)
# single-hyphen-option - single hyphen options (-o)
# double-hyphen-option - double hyphen options (--option)
# back-quoted-argument - backquoted expressions (`foo`)
# single-quoted-argument - single quoted arguments ('foo')
# double-quoted-argument - double quoted arguments ("foo")
# dollar-quoted-argument - dollar quoted arguments ($'foo')
# dollar-double-quoted-argument - parameter expansion inside double quotes ($foo inside "")
# back-double-quoted-argument - back double quoted arguments (\x inside "")
# back-dollar-quoted-argument - back dollar quoted arguments (\x inside $'')
# assign - parameter assignments
# redirection - redirection operators (<, >, etc)
# comment - comments, when setopt INTERACTIVE_COMMENTS is in effect (echo # foo)
# arg0 - a command word other than one of those enumrated above (other than a command, precommand, alias, function, or shell builtin command).
# default - everything else

# To differentiate aliases from other command types
# ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'

# To have paths colored instead of underlined
# ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'

# To disable highlighting of globbing expressions
# ZSH_HIGHLIGHT_STYLES[globbing]='none'

# disable highlighting for unknown-token
ZSH_HIGHLIGHT_STYLES[unknown-token]='none'

# use blue to highlight command(e.g., git)
ZSH_HIGHLIGHT_STYLES[command]='fg=004'

# builtins(e.g., pwd): blue, italic
ZSH_HIGHLIGHT_STYLES[builtin]='fg=004,standout'

# commandseparator(;, &&): lighter gray
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=014'

# alias: blue
ZSH_HIGHLIGHT_STYLES[alias]='fg=004'

# single hyphen-option: darker red,italic
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=124'

# double hyphen-option: darker red
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=124'

# quoted arguments(strings)
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=006'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=006'

# dollar quoted arguments:gold
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=003'

# other commands: red
ZSH_HIGHLIGHT_STYLES[arg0]='fg=001'

# To define styles for nested brackets up to level 4
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=010'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=014'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=010'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=014'
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=001'
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='fg=007'