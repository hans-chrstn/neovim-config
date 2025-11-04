<div align="center">
  <img src="https://github.com/hans-chrstn/neovim-config/blob/main/main.png" alt="Dashboard Screenshot"/>
</div>

<br>

## Keymaps

The leader key is **`<Space>`**.

### General Navigation & Window Management

| Key | Mode | Description |
| :--- | :--- | :--- |
| `<C-k>` | Normal | Navigate window up |
| `<C-j>` | Normal | Navigate window down |
| `<C-h>` | Normal | Navigate window left |
| `<C-l>` | Normal | Navigate window right |

### LSP & Diagnostics

| Key | Mode | Description |
| :--- | :--- | :--- |
| `<leader>d` | Normal | Open diagnostics float |
| `gh` | Normal | LSP Finder (Lspsaga) |
| `<leader>ca` | Normal, Visual | Code Action (Lspsaga) |
| `<leader>rn` | Normal | Rename (Lspsaga) |
| `gp` | Normal | Peek Definition (Lspsaga) |
| `gd` | Normal | Go to Definition (Lspsaga) |
| `gl` | Normal | Line Diagnostics (Lspsaga) |
| `[d` | Normal | Previous Diagnostic (Lspsaga) |
| `]d` | Normal | Next Diagnostic (Lspsaga) |
| `<leader>o` | Normal | Toggle Outline (Lspsaga) |
| `K` | Normal | Hover Documentation (Lspsaga) |
| `gi` | Normal | Go to Implementation (lspconfig) |
| `gs` | Normal | Signature Help (lspconfig) |
| `<leader>th` | Normal | Toggle Inlay Hints (lspconfig) |
| `<leader>xx` | Normal | Toggle Diagnostics (Trouble) |
| `<leader>xX` | Normal | Toggle Buffer Diagnostics (Trouble) |
| `<leader>cs` | Normal | Toggle Symbols (Trouble) |
| `<leader>cl` | Normal | Toggle LSP Definitions/References (Trouble) |
| `<leader>xL` | Normal | Toggle Location List (Trouble) |
| `<leader>xQ` | Normal | Toggle Quickfix List (Trouble) |
| `<leader>xt` | Normal | Toggle Todo (Trouble) |
| `<leader>xT` | Normal | Toggle Todo/Fix/Fixme (Trouble) |

### Editing & Text

| Key | Mode | Description |
| :--- | :--- | :--- |
| `<leader>f` | Normal | Format Document (lspconfig) |
| `<leader>cf` | Normal | Format Buffer (conform) |
| `<leader>cF` | Visual | Format Lines (conform) |
| `<leader>uf` | Normal | Toggle Format Globally (conform) |
| `<leader>uF` | Normal | Toggle Format Locally (conform) |
| `]t` | Normal | Jump to Next Todo Comment |
| `[t` | Normal | Jump to Previous Todo Comment |
| `<leader>u` | Normal | Open Undo Tree (undo-glow) |

#### Treesitter Text Objects

| Key | Mode | Description |
| :--- | :--- | :--- |
| `<C-space>` | Visual | Init/Increment Incremental Selection |
| `<bs>` | Visual | Decrement Incremental Selection |
| `aa` / `ia` | Operator | Around / Inside parameter |
| `af` / `if` | Operator | Around / Inside function |
| `ac` / `ic` | Operator | Around / Inside class |
| `ai` / `ii` | Operator | Around / Inside conditional |
| `al` / `il` | Operator | Around / Inside loop |
| `at` | Operator | Around comment |

#### Treesitter Movement

| Key | Mode | Description |
| :--- | :--- | :--- |
| `]m` / `[m` | Normal | Go to next/previous function start |
| `]M` / `[M` | Normal | Go to next/previous function end |
| `]]` / `[[` | Normal | Go to next/previous class start |
| `][` / `[]` | Normal | Go to next/previous class end |

#### Treesitter Swap

| Key | Mode | Description |
| :--- | :--- | :--- |
| `<leader>a` | Normal | Swap next parameter |
| `<leader>A` | Normal | Swap previous parameter |

#### nvim-surround

| Key | Mode | Description |
| :--- | :--- | :--- |
| `ys` | Normal | Add surround |
| `yss` | Normal | Add surround to current line |
| `yS` | Normal | Add surround line |
| `ySS` | Normal | Add surround to current line (alias) |
| `ds` | Normal | Delete surround |
| `cs` | Normal | Change surround |
| `cS` | Normal | Change surround line |
| `S` | Visual | Add surround to selection |
| `gS` | Visual | Add surround to selection line |
| `<C-g>s` | Insert | Insert surround |
| `<C-g>S` | Insert | Insert surround line |

### Motion (flash.nvim)

| Key | Mode | Description |
| :--- | :--- | :--- |
| `s` | Normal, Visual, Operator | Flash (Jump) |
| `S` | Normal, Visual, Operator | Flash Treesitter |
| `r` | Operator | Remote Flash |
| `R` | Operator, Visual | Treesitter Search |
| `<c-s>` | Command | Toggle Flash Search |

### Search (Telescope)

| Key | Mode | Description |
| :--- | :--- | :--- |
| `<leader><space>` | Normal | Find project files |
| `<leader>:` | Normal | Command History |
| `<leader>b` | Normal | Buffers |
| `<C-p>` | Normal | Search git files |
| `<leader>ff` | Normal | Find Files |
| `<leader>/` | Normal | Live Grep |
| `<leader>fb` | Normal | Buffers |
| `<leader>fr` | Normal | Resume |
| `<leader>sh` | Normal | Help Tags |
| `<leader>sa` | Normal | Auto Commands |
| `<leader>sb` | Normal | Buffer (current buffer fuzzy find) |
| `<leader>sc` | Normal | Command History |
| `<leader>sC` | Normal | Commands |
| `<leader>sD` | Normal | Workspace diagnostics |
| `<leader>sd` | Normal | Document Diagnostics |
| `<leader>sH` | Normal | Search Highlight Groups |
| `<leader>sk` | Normal | Keymaps |
| `<leader>sM` | Normal | Man pages |
| `<leader>sm` | Normal | Jump to Mark |
| `<leader>so` | Normal | Options |
| `<leader>sR` | Normal | Resume |
| `<leader>st` | Normal | Todo (Telescope) |
| `<leader>uC` | Normal | Colorscheme preview |

### 💻 Terminal (snacks.nvim)

| Key | Mode | Description |
| :--- | :--- | :--- |
| `<leader>tt` | Normal | Toggle Terminal (Split) |
| `<Esc>` | Terminal | Enter Normal mode |
| `q` | Normal (in terminal) | Hide/Close terminal window |

### Completion (blink.cmp)

| Key | Mode | Description |
| :--- | :--- | :--- |
| `<Tab>` | Insert | Accept completion or snippet forward |
| `<S-Tab>` | Insert | Snippet backward |
| `<CR>` | Insert | Accept completion |
| `<C-Space>` | Insert | Show completion/documentation |
| `<C-j>` / `<Down>` | Insert | Select next item |
| `<C-k>` / `<Up>` | Insert | Select previous item |
| `<C-u>` | Insert | Scroll documentation up |
| `<C-d>` | Insert | Scroll documentation down |

### Debugging (nvim-dap)

| Key | Mode | Description |
| :--- | :--- | :--- |
| `<leader>db` | Normal | Toggle Breakpoint |
| `<leader>dc` | Normal | Continue |
| `<leader>di` | Normal | Step Into |
| `<leader>do` | Normal | Step Over |
| `<leader>dO` | Normal | Step Out |
| `<leader>dr` | Normal | Toggle REPL |
| `<leader>dl` | Normal | Run Last |
| `<leader>dt` | Normal | Toggle DAP UI |

### Git (gitsigns.nvim & snacks.nvim)

| Key | Mode | Description |
| :--- | :--- | :--- |
| `<leader>ghb` | Normal | Blame Line (gitsigns) |
| `<leader>ghd` | Normal | Diff This (gitsigns) |
| `<leader>ghp` | Normal | Preview Hunk (gitsigns) |
| `<leader>ghR` | Normal | Reset Buffer (gitsigns) |
| `<leader>ghr` | Normal, Visual | Reset Hunk (gitsigns) |
| `<leader>ghs` | Normal, Visual | Stage Hunk (gitsigns) |
| `<leader>ghS` | Normal | Stage Buffer (gitsigns) |
| `<leader>ghu` | Normal | Undo Stage Hunk (gitsigns) |
| `]h` | Normal | Next Hunk (gitsigns) |
| `[h` | Normal | Previous Hunk (gitsigns) |
| `<leader>gtb` | Normal | Toggle Line Blame (gitsigns) |
| `<leader>gtd` | Normal | Toggle Deleted (gitsigns) |
| `<leader>gb` | Normal | Open in GitHub/GitLab (snacks) |
| `<leader>gB` | Normal | Git Blame Line (snacks) |
| `<leader>lg` | Normal | LazyGit (snacks) |
| `<leader>gg` | Normal | LazyGit (snacks) |
| `<leader>gf` | Normal | LazyGit Current File History (snacks) |
| `<leader>gl` | Normal | LazyGit Log (snacks) |
| `<leader>gc` | Normal | Git Commits (Telescope) |
| `<leader>gs` | Normal | Git Status (Telescope) |

### Plugin & Session Management

| Key | Mode | Description |
| :--- | :--- | :--- |
| `<leader>e` | Normal | Open yazi at the current file |
| `<leader>cw` | Normal | Open yazi at the current working directory |
| `<c-up>` | Normal | Resume the last yazi session |
| `<leader>qs` | Normal | Restore Session (persistence) |
| `<leader>ql` | Normal | Restore Last Session (persistence) |
| `<leader>qd` | Normal | Don't Save Current Session (persistence) |
| `<leader>z` | Normal | Toggle Zen Mode (snacks) |
| `<leader>rn` | Normal | Rename File (LSP-aware) (snacks) |
| `<leader>bd` | Normal | Delete Buffer (snacks) |
| `<leader>bD` | Normal | Delete All Buffers (snacks) |
| `<leader>bo` | Normal | Delete Other Buffers (snacks) |
| `]]` | Normal | Next Word Reference (snacks) |
| `[[` | Normal | Previous Word Reference (snacks) |
| `<leader>un` | Normal | Dismiss All Notifications (notify) |
| `<leader>Ct` | Normal | Toggle Discord Presence (cord) |
| `<leader>Ci` | Normal | Toggle Idle Status (cord) |

