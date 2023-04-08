## Disable the Fish Shell greeting
set -U fish_greeting

## Navigation alias
alias ..='cd ..'
alias ...='cd ../..'

## Git delete local branch shortcut
function gbd
    git branch -D $argv
end

## Git checkout branch shortcut
function gco
    git checkout $argv
end

## Git checkout new branch shortcut
function gcob
    git checkout -b $argv
end

## Ls command formatted showing hidden files
function lsa
    ls -lah $argv 
end

## mkdir and cd into the directory
function mkdircd
    mkdir $argv && cd $argv
end

## Copy the entire directory including sub-folders
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

## Mac-Only, print the Wifi network name
function wifi-network-name
    /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'
end

## Mac-Only, print the current Wifi password
function wifi-password
    security find-generic-password -wa (wifi-network-name)
end

## A Mashup of the Fish default and the fishy-drupal prompts
## Without the Drush and Drupal integrations
## Default: https://github.com/oh-my-fish/theme-default
## Fishy-Drupal: https://github.com/oh-my-fish/theme-fishy-drupal
function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
  set -l current_user (whoami)
  set -l last_command_status $status
  
  set -l fish     "⋊>"
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l green (set_color -o green)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l normal (set_color normal)
  set -l success_color    (set_color $fish_pager_color_progress 2> /dev/null; or set_color cyan)
  set -l error_color      (set_color $fish_color_error 2> /dev/null; or set_color red --bold)

  set -l cwd (set_color $fish_color_cwd)(prompt_pwd)

  if [ (_git_branch_name) ]
    set -l git_branch $red(_git_branch_name)
    set git_info "$blue git:($git_branch$blue)"

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow ✗"
      set git_dirty "$dirty"
    end
  end

  if test $last_command_status -eq 0
    echo -n -s $current_user ' ' $success_color $fish $normal ' ' $cwd $git_info $git_dirty $normal ' '
  else
    echo -n -s $current_user ' ' $error_color $fish $normal ' ' $cwd $git_info $git_dirty $normal ' '
  end

end
## prompt end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
fish_add_path /opt/homebrew/sbin
## https://riptutorial.com/node-js/example/17273/installing-with-node-version-manager-under-fish-shell-with-oh-my-fish-
fish_add_path ~/.nvm
fish_add_path /Users/seanc/Library/Android/sdk/platform-tools/