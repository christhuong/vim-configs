local M = {}

function M.config()
  local status_ok, nvimtree = pcall(require, "nvim-tree")
  if not status_ok then
    return
  end

  local g = vim.g

  g.nvim_tree_disable_window_picker = 1
  g.nvim_tree_respect_buf_cwd = 1

  g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
      deleted = "",
      ignored = "◌",
      renamed = "➜",
      staged = "✓",
      unmerged = "",
      unstaged = "✗",
      untracked = "★",
    },
    folder = {
      default = "",
      empty = "",
      empty_open = "",
      open = "",
      symlink = "",
      symlink_open = "",
    },
  }

  nvimtree.setup {
    filters = {
      dotfiles = false,
      custom = {
        ".git",
        "node_modules",
        ".cache",
      },
    },
    disable_netrw = true,
    hijack_netrw = true,
    ignore_ft_on_setup = {
      "dashboard",
      "startify",
      "alpha",
    },
    auto_close = false,
    open_on_tab = false,
    quit_on_open = false,
    hijack_cursor = true,
    hide_root_folder = true,
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
    },
    diagnostics = {
      enable = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    view = {
      width = 25,
      height = 30,
      side = "left",
      allow_resize = true,
      hide_root_folder = false,
      number = true,
      relativenumber = false,
      signcolumn = "no",
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 500,
    },
    show_icons = {
      git = 1,
      folders = 1,
      files = 1,
      folder_arrows = 0,
      tree_width = 30,
    },
    actions = {
      open_file = {
        quit_on_open = true,
      }
    }
  }
end

return M
