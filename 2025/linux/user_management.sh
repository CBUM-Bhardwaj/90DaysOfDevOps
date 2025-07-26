#!/bin/bash
# This line tells the system to use Bash to run the script.

# ---------------------------------------------------
# Simple User Management Script for Beginners
# Supports: create, delete, reset password, list users, help
# Must be run with sudo or as root to work correctly
# ---------------------------------------------------

# Check if the script is being run by the root user
if [ "$EUID" -ne 0 ]; then
  # "$EUID" holds the effective user ID of the current user
  # If it's not 0, you're not root (0 is always root in Linux)
  echo "Please run this script as root."
  exit 1  # Exit the script with error code 1
fi

# ---------------------------------------
# Function to show usage/help information
# ---------------------------------------
show_help() {
  echo "Simple User Management Script"
  echo "Usage: $0 [option]"  # $0 is the script name
  echo ""
  echo "Options:"
  echo "   -c,     - Create a new user"
  echo "   -d,     - Delete a user"
  echo "   -r,     - Reset user password"
  echo "   -l,     - Show user list"
  echo "   -h,     - Show this help"
}

# ----------------------------
# Function to create a new user
# ----------------------------
create_user() {
  read -p "Enter new username: " username
  # Prompts the user to type a username and stores it in variable `username`

  if id "$username" &>/dev/null; then
    # Checks if the username already exists
    # `id` command gets user info; if it succeeds, the user exists
    # `&>/dev/null` hides both output and error messages
    echo "User '$username' already exists."
    return  # Stop function here (but don't exit the script)
  fi

  read -s -p "Enter password: " password
  # Asks for a password silently (-s = no display)
  echo  # Moves to a new line after password input

  useradd "$username"
  # Adds the new user to the system

  echo "$username:$password" | chpasswd
  # Feeds the username and password into `chpasswd` to set the password

  echo "User '$username' created."
  # Shows confirmation
}

# ----------------------------
# Function to delete a user
# ----------------------------
delete_user() {
  read -p "Enter username to delete: " username
  # Asks for the username to delete

  if ! id "$username" &>/dev/null; then
    # If the user does NOT exist (! negates the check)
    echo "User '$username' does not exist."
    return
  fi

  userdel -r "$username"
  # Deletes the user and their home directory (-r = recursive)

  echo "User '$username' deleted."
}

# -------------------------------------
# Function to reset a user's password
# -------------------------------------
reset_password() {
  read -p "Enter username to reset password: " username
  # Prompts for the username whose password should be reset

  if ! id "$username" &>/dev/null; then
    # If the user doesn't exist, show an error and stop
    echo "User '$username' does not exist."
    return
  fi

  read -s -p "Enter new password: " password
  # Asks for the new password silently
  echo

  echo "$username:$password" | chpasswd
  # Sends the new password to `chpasswd` for updating

  echo "Password for '$username' has been reset."
}

# ------------------------------
# Function to list system users
# ------------------------------
list_users() {
  echo "User List:"
  # Heading for user list

  # Use `awk` to read /etc/passwd and print users with UID >= 1000
  # UID >= 1000 usually means a regular (non-system) user
  awk -F: '$3 >= 1000 && $3 < 60000 { print "- " $1 " (UID: " $3 ")" }' /etc/passwd
  # -F: means "use ':' as field separator"
  # $1 is username, $3 is UID
}

# ---------------------------
# Main part of the script
# ---------------------------


# This part decides what to do based on the first argument passed to the script
# For example: ./script.sh -c will call the create_user function

case "$1" in
  -c)
    # If the user types -c, we want to create a new user
    create_user
    ;;
    
  -d)
    # If the user types -d, we want to delete an existing user
    delete_user
    ;;

  -r)
    # If the user types -r, we want to reset a user's password
    reset_password
    ;;

  -l)
    # If the user types -l, we want to list all normal users
    list_users
    ;;

  -h|*)
    # If the user types -h OR anything else (including nothing), show the help menu
    # The |* part is like a "default" or "otherwise" catch-all
    show_help
    ;;
esac

