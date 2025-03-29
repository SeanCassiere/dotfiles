#!/bin/bash

# Configuration file located in the same directory as the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/symlinks.conf"

# Function to create symlinks
create_symlink() {
    local src="$1"
    local dest="$2"
    
    # Expand ~ to the full home directory path
    src="${src/#\~/$HOME}"
    dest="${dest/#\~/$HOME}"
    
    # Ensure the source exists
    if [[ ! -e "$src" ]]; then
        echo "Skipping: Source $src does not exist."
        return
    fi
    
    # Remove existing symlink or file/directory at destination
    if [[ -e "$dest" || -L "$dest" ]]; then
        echo "Removing existing: $dest"
        rm -rf "$dest"
    fi
    
    # Create the symlink
    ln -s "$src" "$dest"
    echo "Linked: $src -> $dest"
}

# Ensure config file exists
if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "Error: Configuration file $CONFIG_FILE not found."
    exit 1
fi

# Read configuration file and create symlinks
while IFS= read -r line || [[ -n "$line" ]]; do
    # Trim leading and trailing whitespace
    line="${line#"${line%%[![:space:]]*}"}" # Left trim
    line="${line%"${line##*[![:space:]]}"}" # Right trim

    # Skip empty lines and lines starting with '#'
    [[ -z "$line" || "$line" =~ ^# ]] && continue

    # Read source and destination paths
    src=$(echo "$line" | awk '{print $1}')
    dest=$(echo "$line" | awk '{print $2}')

    create_symlink "$src" "$dest"
done < "$CONFIG_FILE"


echo "Symlink setup complete."