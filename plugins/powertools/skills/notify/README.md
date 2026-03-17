# Notify Skill for Claude Code

Send native macOS notifications through Notification Center when Claude completes tasks, encounters errors, or needs user input.

## Quick Start

```bash
/notify complete "Task finished!"
/notify error "Something went wrong"
/notify question "Need your input"
/notify background "Background task done"
```

## Supported Event Types

| Event Type | Description | Sound | Use Case |
|------------|-------------|-------|----------|
| `complete` | Task completed successfully | Hero | When a long-running task finishes |
| `error` | Task failed or error occurred | Sosumi | When something goes wrong |
| `question` | Claude needs user input | Blow | When Claude needs clarification |
| `background` | Background task completed | Glass | When a background process finishes |

## Usage Examples

### Basic Usage

Send notification with default message:
```bash
/notify complete
```

Send notification with custom message:
```bash
/notify complete "Build finished successfully in 2m 34s"
```

### Automatic Notifications

Tell Claude to notify you, and it will automatically invoke the skill:

**Example 1: Task completion**
```
User: "Run the test suite and notify me when it's done"
Claude: [runs tests] /notify complete "All 157 tests passed"
```

**Example 2: Error notification**
```
User: "Deploy to staging and notify me if it fails"
Claude: [attempts deploy, encounters error] /notify error "Deployment failed: connection timeout"
```

**Example 3: Question notification**
```
User: "Refactor the auth module and notify me if you need my input"
Claude: [starts refactoring, finds ambiguity] /notify question "Should I use JWT or session tokens?"
```

## Features

### Auto-Dependency Installation
The skill automatically detects and installs `terminal-notifier` if it's not present on your system:

1. Checks common installation paths (Apple Silicon and Intel Macs)
2. Falls back to PATH lookup
3. Automatically runs `brew install terminal-notifier` if not found
4. Provides helpful error messages if installation fails

### Cross-Architecture Support
Works seamlessly on:
- **Apple Silicon Macs**: Checks `/opt/homebrew/bin/terminal-notifier` first
- **Intel Macs**: Falls back to `/usr/local/bin/terminal-notifier`
- **Custom installations**: Uses `which terminal-notifier` for non-standard paths

### Actionable Notifications
Clicking any notification activates your Terminal window, bringing you right back to Claude Code.

### Sound Alerts
Each event type has a distinct sound to help you identify what happened without looking:
- **Complete**: Hero (triumphant)
- **Error**: Sosumi (attention-getting)
- **Question**: Blow (gentle prompt)
- **Background**: Glass (subtle chime)

## Requirements

- **macOS**: Uses macOS Notification Center
- **Homebrew**: Required for auto-installation of dependencies
- **terminal-notifier**: Installed automatically if missing

## Installation

The skill is already installed if you're reading this! It's located at:
```
~/.claude/skills/notify/
```

Files:
- `SKILL.md` - Skill metadata and documentation
- `README.md` - This file
- `run.sh` - Skill entry point
- `claude-notifier.sh` - Notification script with dependency management

## Troubleshooting

### Notifications Not Appearing

**Issue**: You don't see notifications in Notification Center

**Solutions**:

1. **Check terminal-notifier installation**:
   ```bash
   which terminal-notifier
   ```
   Should return a path like `/opt/homebrew/bin/terminal-notifier`

2. **Verify Notification Center permissions**:
   - Open **System Settings** → **Notifications**
   - Find **Terminal** (or **iTerm** if using iTerm2) in the list
   - Ensure "Allow notifications" is enabled
   - Set alert style to "Banners" or "Alerts"

3. **Check Do Not Disturb**:
   - Ensure Do Not Disturb is not enabled
   - Check **System Settings** → **Focus**

### Auto-Installation Fails

**Issue**: The skill can't automatically install `terminal-notifier`

**Solutions**:

1. **Verify Homebrew is installed**:
   ```bash
   brew --version
   ```
   If not installed, visit [https://brew.sh/](https://brew.sh/)

2. **Update Homebrew**:
   ```bash
   brew update
   brew doctor
   ```
   Fix any issues reported by `brew doctor`

3. **Manually install terminal-notifier**:
   ```bash
   brew install terminal-notifier
   ```

4. **Check for permission issues**:
   - Ensure you have write permissions to Homebrew directories
   - Try with `sudo` if necessary (though usually not needed)

### No Sound with Notifications

**Issue**: Notifications appear but don't play sounds

**Solutions**:

1. **Check system sound settings**:
   - **System Settings** → **Sound** → **Sound Effects**
   - Ensure "Play sound effects through" is set to your desired output
   - Adjust "Alert volume" slider

2. **Verify sound files exist**:
   The script uses built-in macOS sounds (Glass, Hero, Sosumi, Blow)
   These should be available on all macOS systems

3. **Test with custom sound**:
   ```bash
   ~/.claude/skills/notify/run.sh complete "Test" "Ping"
   ```

### Skill Not Found

**Issue**: `/notify` command not recognized

**Solutions**:

1. **Verify skill directory exists**:
   ```bash
   ls -la ~/.claude/skills/notify/
   ```
   Should show `SKILL.md`, `run.sh`, and `claude-notifier.sh`

2. **Check file permissions**:
   ```bash
   chmod +x ~/.claude/skills/notify/run.sh
   chmod +x ~/.claude/skills/notify/claude-notifier.sh
   ```

3. **Restart Claude Code**:
   Skills are loaded on startup, so restart your Claude session

## Advanced Usage

### Custom Sounds

You can specify custom sounds by modifying `claude-notifier.sh`:

```bash
# Edit the SOUND variable
SOUND="Submarine"  # Options: Glass, Blow, Bottle, Frog, Funk, Hero, Morse, Ping, Pop, Purr, Sosumi, Submarine, Tink
```

### Custom Icons

Add a custom icon by setting `ICON_PATH` in `claude-notifier.sh`:

```bash
ICON_PATH="/path/to/your/icon.png"
```

### Integration with Hooks

You can integrate notifications with Claude Code hooks by adding to your `~/.claude/settings.json`:

```json
{
  "hooks": {
    "afterToolCall": "~/.claude/skills/notify/run.sh background 'Tool call completed'"
  }
}
```

## Testing the Skill

Run these commands to test each notification type:

```bash
# Test completion notification
~/.claude/skills/notify/run.sh complete "Test successful"

# Test error notification
~/.claude/skills/notify/run.sh error "Test error"

# Test question notification
~/.claude/skills/notify/run.sh question "Test question"

# Test background notification
~/.claude/skills/notify/run.sh background "Test background"
```

You should see four different notifications with different sounds.

## Contributing

Found a bug or want to improve the skill? The skill files are located at:
```
~/.claude/skills/notify/
```

Feel free to modify:
- `claude-notifier.sh` for script logic
- `SKILL.md` for skill metadata
- `README.md` (this file) for documentation

## License

This skill is part of your personal Claude Code installation and can be modified freely.

## Version History

- **v1.0.0** (2026-01-30)
  - Initial release
  - Auto-dependency detection and installation
  - Support for complete, error, question, and background events
  - Cross-architecture support (Apple Silicon and Intel)
  - Actionable notifications with sound alerts
