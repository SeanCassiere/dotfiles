## Disable the Fish Shell greeting
set -U fish_greeting

## Navigation alias
alias ..='cd ..'
alias ...='cd ../..'

## Ls command formatted showing hidden files
function lsa
    ls -lah $argv 
end

## mkdir and cd into the directory
function mkdir-cd
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

## Postgress rename Database name
function renamedb --argument from to
    echo "alter database \"$from\" rename to \"$to\"" | psql -d template1
end

## Mac-Only, print the Wifi network name
function wifi-network-name
    /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'
end

## Mac-Only, print the current Wifi password
function wifi-password
    security find-generic-password -wa (wifi-network-name)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
