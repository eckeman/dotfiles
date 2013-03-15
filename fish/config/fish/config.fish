set fish_greeting

set -gx TERM xterm-256color
set -gx EDITOR vim
set -gx LC_ALL en_US.UTF-8


# Paths
set -gx CDPATH .

set PATH $HOME/.local/bin /usr/local/bin $PATH

set -gx NODE_PATH /usr/local/lib/node_modules
set -gx REMOTE_GEM_CACHE_PATH $HOME/.remote-gem-cache


# Less colors
set -x LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
set -x LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
set -x LESS_TERMCAP_me \e'[0m'           # end mode
set -x LESS_TERMCAP_se \e'[0m'           # end standout-mode
set -x LESS_TERMCAP_so \e'[38;5;246m;'   # begin standout-mode - info box
set -x LESS_TERMCAP_ue \e'[0m'           # end underline
set -x LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline


# Alias
function !      ; sudo $argv ; end
function rc     ; rails console ; end
function kc     ; kviberg-config $argv ; end

# ls
function l      ; ls -la ; end
function l.     ; ls -d .* ; end
function ll     ; ls -l ; end

# mkdir
function mkdir  ; command mkdir -p $argv ; end
function mkcd   ; mkdir $argv; and cd $argv ; end

# git
function g    ; git $argv ; end
function gs   ; git status $argv ; end

function gl   ; git l $argv ; end
function gls  ; git ls $argv ; end
function gwc  ; git wc $argv ; end

function gd   ; git diff $argv ; end
function gdw  ; git diff --color-words $argv ; end
function gds  ; git diff --stat $argv ; end
function gdv  ; git diff -w $argv | view - ; end

function ga   ; git add $argv ; end
function gc   ; git commit -v $argv ; end
function gca  ; git commit -v -a $argv ; end

function gb   ; git branch $argv ; end
function gco  ; git checkout $argv ; end

function gf   ; git fetch $argv ; end
function gm   ; git merge $argv ; end
function gr   ; git rebase $argv ; end


# Fry
set -l fry_path /usr/local/share/fry
if test -d $fry_path/fry.fish
  . $fry_path/fry.fish
  set fish_function_path $fry_path/functions $fish_function_path
  set fish_complete_path $fry_path/completions $fish_function_path
end


# Plugins
for plugin in $HOME/.config/fish/plugins/*
  if test -d $plugin
    if not contains $plugin/functions $fish_function_path
      if test -d $plugin/functions
        set fish_function_path $plugin/functions $fish_function_path
      end
    end
    if not contains $plugin/completions $fish_complete_path
      if test -d $plugin/completions
        set fish_complete_path $plugin/completions $fish_complete_path
      end
    end

    set plugin $plugin/(basename $plugin).fish
  end

  if test -f $plugin
    . $plugin
  end
end
