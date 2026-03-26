---
name: git-wiki
description: Interact with GitHub and GitLab wiki repositories — clone, search, read, create, edit, delete, and push wiki pages. Use when the user asks to view, search, update, or manage wiki content for a repository.
---

# Git Wiki

Manage git-backed wiki repositories (GitHub and GitLab) directly from the CLI.

## When to Use This Skill

Use this skill when the user wants to:

- Read or search wiki pages for a repository
- Create, edit, or delete wiki pages
- List all wiki pages
- Push wiki changes
- Clone a wiki repo for the first time

## How Git Wikis Work

GitHub and GitLab expose each repository's wiki as a separate git repo:

- **GitHub:** `https://github.com/{owner}/{repo}.wiki.git`
- **GitLab:** `https://gitlab.com/{owner}/{repo}.wiki.git`

Wiki pages are Markdown files at the repo root. The filename (minus `.md`) becomes the page title. `Home.md` is the landing page.

Directory nesting is supported — `guides/setup.md` renders as a page titled "setup" under a "guides" section. Sidebars use `_Sidebar.md`, footers use `_Footer.md`.

## Workflow

### Step 1: Determine the Wiki Repo

Ask the user which repository's wiki they want to work with, unless it's obvious from context (e.g., they're inside a repo or specified it).

Construct the wiki clone URL:
- For GitHub: `https://github.com/{owner}/{repo}.wiki.git`
- For GitLab: `https://gitlab.com/{owner}/{repo}.wiki.git`

If the user provides an SSH-based remote, adjust accordingly:
- `git@github.com:{owner}/{repo}.wiki.git`

### Step 2: Clone the Wiki

Clone into a temporary working directory so you don't pollute the user's project:

```bash
WIKI_DIR=$(mktemp -d)/wiki
git clone <wiki-url> "$WIKI_DIR"
```

If cloning fails with a 404 or empty repository error, the wiki likely hasn't been initialized. Inform the user they need to create at least one page via the web UI first (GitHub requires this), or offer to initialize it:

```bash
WIKI_DIR=$(mktemp -d)/wiki
mkdir "$WIKI_DIR" && cd "$WIKI_DIR" && git init
git remote add origin <wiki-url>
```

### Step 3: Perform the Requested Action

#### List Pages
```bash
find "$WIKI_DIR" -name '*.md' -not -name '_*' | sort
```

#### Read a Page
Read the file directly using the Read tool. Page names map to filenames: "Getting Started" -> `Getting-Started.md`. Spaces become hyphens.

#### Search Pages
Use the Grep tool to search across all wiki Markdown files.

#### Create a Page
Write a new `.md` file. Convert the page title to a filename: replace spaces with hyphens, keep casing. Example: "Deployment Guide" -> `Deployment-Guide.md`.

```markdown
# Page Title

Content here.
```

#### Edit a Page
Use the Edit tool on the target file.

#### Delete a Page
```bash
rm "$WIKI_DIR/Page-Name.md"
```

#### Reorder Sidebar
Edit `_Sidebar.md` to control navigation order. Format:

```markdown
* [Home](Home)
* [Getting Started](Getting-Started)
* **Guides**
  * [Setup](guides/setup)
  * [Configuration](guides/configuration)
```

### Step 4: Commit and Push

After making changes, commit and push:

```bash
cd "$WIKI_DIR"
git add -A
git commit -m "Update wiki: <brief description of changes>"
git push origin master
```

GitHub wikis use `master` as the default branch. Check with `git branch` if unsure.

**Always confirm with the user before pushing.** Pushing to a wiki is a shared-state mutation.

### Step 5: Clean Up

After pushing (or if the user is done), remove the temporary directory:

```bash
rm -rf "$WIKI_DIR"
```

## Important Notes

- **Authentication:** Wiki clone/push uses the same git credentials as the main repo. If the user has `gh` configured or SSH keys set up, it should work. If auth fails, suggest `gh auth status` to verify.
- **Branch:** Most wiki repos only have a `master` branch. Do not create feature branches unless the user asks.
- **Confirm before pushing.** Wiki pushes are immediately visible to all repo collaborators.
- **No PRs for wikis.** Git wiki repos do not support pull requests. Changes go directly to `master`.
- **Page links:** Internal wiki links use the format `[[Page Name]]` (GitHub) or `[text](page-name)` (both). Prefer the Markdown link format for portability.
- **Images:** Wiki repos can store images. Place them in an `images/` directory and reference with `![alt](images/filename.png)`.
