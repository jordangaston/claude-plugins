#!/bin/bash

# Claude Code Notification Script for macOS
# Sends native macOS notifications for Claude Code events using terminal-notifier

# Configuration
SOUND="Glass"  # Options: Glass, Blow, Bottle, Frog, Funk, Hero, Morse, Ping, Pop, Purr, Sosumi, Submarine, Tink
ICON_PATH=""   # Optional: path to custom icon image (e.g., path to .icns or .png file)

# Function to detect terminal-notifier installation path
find_terminal_notifier() {
    # Check Apple Silicon Homebrew path first
    if [ -x "/opt/homebrew/bin/terminal-notifier" ]; then
        echo "/opt/homebrew/bin/terminal-notifier"
        return 0
    fi

    # Check Intel Mac Homebrew path
    if [ -x "/usr/local/bin/terminal-notifier" ]; then
        echo "/usr/local/bin/terminal-notifier"
        return 0
    fi

    # Fall back to PATH lookup
    local path_result=$(which terminal-notifier 2>/dev/null)
    if [ -n "$path_result" ] && [ -x "$path_result" ]; then
        echo "$path_result"
        return 0
    fi

    # Not found
    return 1
}

# Function to auto-install terminal-notifier via Homebrew
install_terminal_notifier() {
    # Check if Homebrew is available
    if ! command -v brew &> /dev/null; then
        echo "Error: Homebrew is not installed." >&2
        echo "Please install Homebrew from https://brew.sh/ or manually install terminal-notifier:" >&2
        echo "  brew install terminal-notifier" >&2
        return 1
    fi

    echo "Installing terminal-notifier via Homebrew..." >&2
    if brew install terminal-notifier; then
        echo "Successfully installed terminal-notifier" >&2
        return 0
    else
        echo "Error: Failed to install terminal-notifier via Homebrew" >&2
        echo "Please try installing manually: brew install terminal-notifier" >&2
        return 1
    fi
}

# Get terminal-notifier path, installing if necessary
TERMINAL_NOTIFIER=$(find_terminal_notifier)
if [ -z "$TERMINAL_NOTIFIER" ]; then
    if ! install_terminal_notifier; then
        exit 1
    fi
    # Try to find it again after installation
    TERMINAL_NOTIFIER=$(find_terminal_notifier)
    if [ -z "$TERMINAL_NOTIFIER" ]; then
        echo "Error: terminal-notifier not found even after installation attempt" >&2
        exit 1
    fi
fi

# Function to send macOS notification
send_notification() {
    local title="$1"
    local message="$2"
    local sound="${3:-$SOUND}"

    # Use terminal-notifier for proper Notification Center notifications
    # -timeout 0 makes notifications sticky (never auto-dismiss)
    local cmd="$TERMINAL_NOTIFIER -title 'Claude Code' -subtitle '$title' -message '$message' -sound '$sound' -timeout 0"

    # Add custom icon if specified
    if [ -n "$ICON_PATH" ] && [ -f "$ICON_PATH" ]; then
        cmd="$cmd -appIcon '$ICON_PATH'"
    fi

    # Make notification actionable - clicking it will activate Terminal
    cmd="$cmd -activate com.apple.Terminal"

    eval "$cmd"
}

# Parse command line arguments
case "$1" in
    "needs-help")
        send_notification "Input Needed" "Claude is waiting for your response" "Ping"
        ;;
    "task-complete"|"complete")
        send_notification "Task Complete" "${2:-Claude has finished the task}" "Hero"
        ;;
    "task-started")
        send_notification "Task Started" "${2:-Claude is working on your request}" "Tink"
        ;;
    "error")
        send_notification "Error" "${2:-An error occurred}" "Sosumi"
        ;;
    "question")
        send_notification "Question" "${2:-Claude has a question}" "Blow"
        ;;
    "background-complete"|"background")
        send_notification "Background Task Done" "${2:-Background task completed}" "Glass"
        ;;
    *)
        send_notification "Claude Code" "${1:-Notification from Claude Code}" "$SOUND"
        ;;
esac
