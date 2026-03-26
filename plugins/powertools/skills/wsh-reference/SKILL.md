---
name: wsh-reference
description: "Reference guide for Wave Terminal's wsh CLI commands. Use when the user asks about wsh commands, Wave Terminal CLI usage, or needs help with wsh syntax, flags, and examples. Covers: view, edit, editor, getmeta, setmeta, ai, editconfig, setbg, badge, run, deleteblock, ssh, wsl, web, notify, conn, setconfig, file, launch, getvar/setvar, termscrollback, wavepath, blocks, and secret."
---

# WSH Command Reference

The `wsh` command is always available from Wave blocks. It interacts with Wave blocks and bridges data between your CLI and widget GUIs.

Source: https://docs.waveterm.dev/wsh-reference

---

## view

Open a preview block with the contents of any file or directory.

```sh
wsh view [path]
wsh view -m [path]           # opens in magnified block
```

Preview images, markdown files, and directories. For code/text files, opens a codeedit block.

---

## edit

```sh
wsh edit [path]
wsh edit -m [path]           # opens in magnified block
```

Opens a codeedit block for the specified file. Returns immediately after opening.

---

## editor

```sh
wsh editor [path]
wsh editor -m [path]         # opens in magnified block
```

Opens a codeedit block and **blocks until the editor is closed**. Useful for `$EDITOR`:

```sh
export EDITOR="wsh editor"
```

The file must already exist.

---

## getmeta

View metadata of any block or tab.

```sh
wsh getmeta                          # current terminal block
wsh getmeta -b 2                     # block num 2 (Ctrl+Shift shows numbers)
wsh getmeta -b [blockid]             # specific block
wsh getmeta -b tab                   # current tab
wsh getmeta [-b [blockid]] [key]     # single key
wsh getmeta -b tab "bg:*"            # keys with prefix
wsh getmeta -b tab --clear-prefix "bg:*"  # prefix with clear key
```

**blockid formats:**
- `this` — current block (default)
- `tab` — current tab
- Full UUID (e.g. `d6ff4966-231a-4074-b78a-20acc7226b41`)
- Truncated 8-char UUID (e.g. `a67f55a3`)
- Number < 100 — block number (sequential top-left to bottom-right)

---

## setmeta

Update metadata key-value pairs for blocks and tabs. Same `-b` arguments as getmeta.

```sh
wsh setmeta -b [blockid] [key]=[value]
wsh setmeta -b [blockid] file=~/myfile.txt
wsh setmeta -b [blockid] url=https://waveterm.dev/
wsh setmeta -b tab --json [jsonfile]       # from JSON file
wsh setmeta -b tab --json                  # from stdin
```

Copy background keys between tabs:
```sh
wsh getmeta -b [other-tab-id] "bg:*" --clear-prefix | wsh setmeta -b tab --json -
```

---

## ai

Append content to the Wave AI sidebar. Files are attached as proper file attachments (images, PDFs, text). Use `-` for stdin.

```sh
wsh ai main.go utils.go                    # attach files
wsh ai app.py -m "find potential bugs"     # attach with message
wsh ai config.json -s -m "explain this"    # auto-submit
wsh ai -n report.pdf -m "summarize"        # new chat
git diff | wsh ai -                        # pipe stdin
```

**File size limits:** Text 200KB, PDF 5MB, Image 7MB. Max 15 files per command.

**Flags:**
- `-m, --message <text>` — add message text
- `-s, --submit` — auto-submit immediately
- `-n, --new` — clear chat and start fresh

---

## editconfig

Open Wave's config files.

```sh
wsh editconfig                    # settings.json (default)
wsh editconfig presets.json
wsh editconfig widgets.json
wsh editconfig presets/ai.json
```

---

## setbg

Set background image or color for the current tab.

```sh
wsh setbg [flags] (image-path|"#color"|color-name)
```

**Flags:**
- `--opacity <0.0-1.0>` — background opacity (default 0.5)
- `--tile` — tile the image
- `--center` — center without scaling
- `--size <value>` — size for centered images (px, %, auto)
- `--clear` — remove background
- `--border-color <color>` — block frame border color
- `--active-border-color <color>` — focused border color
- `--print` — show metadata without applying

```sh
wsh setbg ~/pictures/bg.jpg
wsh setbg --opacity 0.3 ~/pictures/pattern.png
wsh setbg --tile --opacity 0.2 ~/pictures/texture.png
wsh setbg --center --size 200px ~/pictures/logo.png
wsh setbg "#ff0000"
wsh setbg forestgreen
wsh setbg --clear
```

Supported formats: JPEG, PNG, GIF, WebP, SVG.

---

## badge

(v0.14.2+) Set or clear a visual badge on a block or tab header.

```sh
wsh badge [icon]        # default icon: circle-small
wsh badge --clear
```

Icons are Font Awesome names (without `fa-` prefix).

**Flags:**
- `--color <color>` — badge color
- `--priority <float>` — badge priority (default 10)
- `--clear` — remove badge
- `--beep` — play system bell
- `--pid <int>` — auto-clear when PID exits (default priority 5)
- `-b, --block <blockid>` — target block/tab

```sh
wsh badge circle-check --color green
wsh badge triangle-exclamation --color red --priority 20 -b 2
wsh badge --pid 12345
wsh badge circle-check --beep
wsh badge --clear -b tab
```

---

## run

Create a new terminal block and execute a command.

```sh
wsh run -- ls -la
wsh run -c "ls -la"
wsh run --cwd /path/to/dir -- ./script.sh
wsh run -m -- make build
wsh run -x -- npm test              # auto-close on success
wsh run -X -- ./task.sh             # auto-close regardless
```

**Flags:**
- `-m, --magnified` — magnified mode
- `-c, --command <string>` — run command string in shell
- `-x, --exit` — close on success (stay open on error)
- `-X, --forceexit` — close on any exit
- `--delay <ms>` — delay before closing (default 2000)
- `-p, --paused` — start in paused state
- `-a, --append` — append output on restart
- `--cwd <string>` — working directory

---

## deleteblock

```sh
wsh deleteblock -b [blockid]
```

Delete the specified block.

---

## ssh

```sh
wsh ssh [user@host]
wsh ssh -i [identity-file] [user@host]
```

Connect using Wave's internal SSH implementation.

---

## wsl

```sh
wsh wsl [-d <distribution-name>]
```

Connect to a WSL distribution. Uses default if none specified.

---

## web

Open URLs in a web block.

```sh
wsh web open [url]
wsh web open -m [url]              # magnified
wsh web open -r [blockid] [url]    # replace existing block
wsh web open "search query"        # search with configured engine
```

`--replace` and `--magnified` cannot be used together.

---

## notify

Create a desktop notification.

```sh
wsh notify [message]
wsh notify -t "Title" "message"
wsh notify -s "silent message"
```

**Flags:**
- `-t, --title <string>` — notification title (default "Wsh Notify")
- `-s, --silent` — disable sound

Works on remote machines.

---

## conn

Connection management.

```sh
wsh conn status                          # all connection statuses
wsh conn connect [user@host]             # connect (no block)
wsh conn disconnect [user@host]          # disconnect
wsh conn ensure [user@host]              # connect if not connected
wsh conn reinstall [user@host]           # reinstall shell extensions
```

WSL connections use `wsl://<distribution-name>` format.

---

## setconfig

```sh
wsh setconfig [config-name]=[config-value]
```

Set options in `config/settings.json`. Validates config options.

---

## file

File management across storage systems including remote SSH hosts.

**URI format:** `[profile]:[uri-scheme]://[connection]/[path]`

**Shorthands:**
- `[path]` — relative/absolute on current remote
- `//[remote]/[path]` — path on a remote
- `/~/[path]` — relative to home on local

### Subcommands

```sh
wsh file cat [file-uri]                              # display contents (max 10MB)
wsh file write [file-uri]                            # write stdin to file (max 10MB)
wsh file append [file-uri]                           # append stdin (max 10MB total)
wsh file rm [-r] [file-uri]                          # remove file (-r for recursive)
wsh file info [file-uri]                             # file info (size, timestamps)
wsh file cp [-f] [-m] [source] [destination]         # copy (-f force, -m merge dirs)
wsh file mv [-f] [source] [destination]              # move (-f force)
wsh file ls [-l] [-1] [-f] [file-uri]                # list (-l long, -1 one-per-line, -f files only)
```

```sh
# Cross-system examples
wsh file cp wsh://user@ec2/home/user/config.txt ./local.txt
wsh file mv ./local.txt wsh://user@server/home/user/backup.txt
wsh file ls wsh://user@ec2/home/user/
wsh file ls ./ | grep ".json$"
```

---

## launch

Open pre-configured widgets.

```sh
wsh launch [widget-id]
wsh launch -m [widget-id]    # magnified
```

---

## getvar / setvar

Persistent variables at block, tab, workspace, or client scope.

```sh
# Set variables
wsh setvar KEY=VALUE
wsh setvar HOST=localhost PORT=8080
wsh setvar -l BLOCK_VAR=value          # block-local
wsh setvar -r KEY                      # remove
wsh setvar -b tab MYVAR=value          # tab scope

# Get variables
wsh getvar KEY
wsh getvar -l BLOCK_VAR                # block-local
wsh getvar --all                       # list all
wsh getvar -b workspace MYVAR          # workspace scope
```

Scopes via `-b`: `block`, `tab`, `workspace`, `client`, or UUID.

```sh
# Use in scripts
if wsh getvar API_KEY >/dev/null; then echo "set"; fi
curl -H "Authorization: $(wsh getvar API_KEY)" https://api.example.com
```

---

## termscrollback

Get terminal scrollback from a terminal block.

```sh
wsh termscrollback
wsh termscrollback -b 2
wsh termscrollback --lastcommand
wsh termscrollback --start 100 --end 200
wsh termscrollback -o terminal-log.txt
wsh termscrollback --lastcommand | grep "ERROR"
```

**Flags:**
- `-b, --block <blockid>` — target block (default: current)
- `--start <line>` — starting line (default: 0)
- `--end <line>` — ending line (default: 0 = all)
- `--lastcommand` — last command output (requires shell integration)
- `-o, --output <file>` — write to file

---

## wavepath

Get paths to Wave Terminal directories.

```sh
wsh wavepath config    # configuration files
wsh wavepath data      # persistent data
wsh wavepath log       # main log file
wsh wavepath -o log    # open in new block
wsh wavepath -O config # open in external app
wsh wavepath -t log    # tail ~100 lines (log only)
```

---

## blocks

```sh
wsh blocks list
wsh blocks list --view=term
wsh blocks list --workspace=[id]
wsh blocks list --tab=[id]
wsh blocks list --json
```

**Flags:**
- `--workspace <id>` — filter by workspace
- `--window <id>` — filter by window
- `--tab <id>` — filter by tab
- `--view <type>` — filter by view (term, web, preview, edit, sysinfo, waveai)
- `--json` — JSON output
- `--timeout <ms>` — RPC timeout (default 5000)

---

## secret

Secure storage using system's native secret backend (Keychain on macOS, Secret Service on Linux, Credential Manager on Windows).

Secret names: must start with a letter, contain only letters, numbers, underscores.

```sh
wsh secret set github_token=ghp_abc123
wsh secret get github_token
wsh secret list
wsh secret delete github_token
wsh secret ui              # graphical interface
wsh secret ui -m           # magnified
```

Secrets work across remote machines — store locally, access from any SSH/WSL connection.

```sh
export API_KEY=$(wsh secret get my_api_key)
```
