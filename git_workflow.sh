#!/bin/bash

# Function to check if Git is initialized
check_git_initialized() {
    if [ ! -d .git ]; then
        git init
    fi
}

# Function to set global Git configuration
set_git_config() {
    local config_key=$1
    local config_value

    read -p "Enter your $config_key: " config_value
    git config --global $config_key "$config_value"
}

# Function to create and switch to a new branch
create_and_checkout_branch() {
    local branch_name

    read -p "Enter branch name: " branch_name
    git checkout -b $branch_name
}

# Function to add, commit, and push changes
add_commit_push() {
    git add .
    git commit -m "Commit changes"
    git remote add origin $1
    git push -u origin main
}

# Main script execution starts here
check_git_initialized

set_git_config "user.name"
set_git_config "user.email"

create_and_checkout_branch

# Add, commit, and push changes
read -p "Enter remote repository URL: " remote_url
add_commit_push $remote_url

echo "Git workflow completed successfully."

