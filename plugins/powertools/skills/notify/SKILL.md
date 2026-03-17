---
name: notify
description: Send macOS notifications to the user for Claude Code events
version: 1.0.0
command: ${HOME}/.claude/skills/notify/run.sh
---

# Notify Skill

Use this skill to send macOS notifications to the user through Notification Center when tasks complete, errors occur, or user input is needed.

## When to Use This Skill

Invoke this skill when:
- User explicitly requests notification (e.g., "notify me when done")
- Long-running tasks complete (>30 seconds)
- Errors occur that require user attention
- You need user input and want to alert them
- Background tasks complete

## [CRITICAL] Usage
You must invoke this script in order to send the notification
```bash
${HOME}/.claude/skills/notify/run.sh <event-type> [message]
```

**Event types:**
- `complete` - Task completed successfully
- `error` - Task failed or encountered an error
- `question` - You need user input
- `background` - Background task completed

## Examples

**User says:** "Run the test suite and notify me when it's done"

You should invoke when tests finish:
```bash
${HOME}/.claude/skills/notify/run.sh complete "Test suite completed: 157 tests passed"
```

**User says:** "Deploy to staging and let me know if it fails"

You should invoke if deployment fails:
```bash
${HOME}/.claude/skills/notify/run.sh error "Deployment failed: connection timeout"
```

**User says:** "Refactor the auth module and ping me if you need my input"

You should invoke when you need clarification:
```bash
${HOME}/.claude/skills/notify/run.sh question "Should I use JWT or session tokens for authentication?"
```

**User says:** "Start the build in the background and notify me when done"

You should invoke when background build completes:
```bash
${HOME}/.claude/skills/notify/run.sh background "Build completed successfully in 2m 34s"
```

## Features

- **Auto-dependency installation**: Automatically installs `terminal-notifier` via Homebrew if not present
- **Cross-architecture support**: Works on both Intel and Apple Silicon Macs
- **Actionable notifications**: Clicking a notification activates the Terminal window
- **Sound alerts**: Different sounds for different event types
- **Notification Center integration**: Notifications appear in macOS Notification Center

## Requirements

- macOS (uses macOS Notification Center)
- Homebrew (for auto-installation of dependencies)
- `terminal-notifier` (installed automatically if missing)

## Troubleshooting

### Notifications not appearing

1. Check that terminal-notifier is installed:
   ```bash
   which terminal-notifier
   ```

2. Verify Notification Center permissions:
   - Open System Settings → Notifications
   - Find Terminal in the list
   - Ensure notifications are allowed

### Installation fails

If automatic installation of `terminal-notifier` fails:

1. Ensure Homebrew is installed:
   ```bash
   brew --version
   ```

2. Manually install terminal-notifier:
   ```bash
   brew install terminal-notifier
   ```

3. Check for connectivity issues or Homebrew updates:
   ```bash
   brew update
   brew doctor
   ```

### No sound with notifications

Check your macOS sound settings:
- System Settings → Sound → Sound Effects
- Ensure "Play sound effects through" is set to your desired output device
- Adjust "Alert volume" slider

## Implementation

The skill executes `claude-notifier.sh` located in the same directory, which handles:
- Terminal-notifier path detection (Apple Silicon and Intel paths)
- Automatic dependency installation via Homebrew
- Notification delivery with appropriate titles, messages, and sounds
