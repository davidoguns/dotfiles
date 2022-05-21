-- vim.g.nvim_tree_quit_on_open = 1 -- 0 by default, closes the tree when you open a file
vim.g.nvim_tree_highlight_opened_files = 1  -- 0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_root_folder_modifier = ':~'  -- This is the default. See :help filename-modifiers for more options
vim.g.nvim_tree_add_trailing = 1  -- 0 by default, append a trailing slash to folder names
vim.g.nvim_tree_refresh_wait = 500  -- 1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.

-- DO NOT want the following, kept here for easier review
-- vim.g.nvim_tree_icon_padding = ' '  -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
-- vim.g.nvim_tree_group_empty = 1  -- 0 by default, compact folders that only contain a single folder into one node in the file tree
-- vim.g.nvim_tree_disable_window_picker = 1  -- 0 by default, will disable the window picker.
-- vim.g.nvim_tree_symlink_arrow = ' >> '  -- defaults to ' ➛ '. used as a separator between symlinks' source and target.
-- vim.g.nvim_tree_respect_buf_cwd = 1  -- 0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
-- vim.g.nvim_tree_create_in_closed_folder = 0  -- 1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
-- vim.g.nvim_tree_indent_markers = 1  -- 0 by default, this option shows indent markers when folders are open

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

-- local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
-- if not config_status_ok then
--   return
-- end
--
-- local tree_cb = nvim_tree_config.nvim_tree_callback

-- some of the following don't seem to actually work, revisit
nvim_tree.setup {
  auto_reload_on_write = true,
  disable_netrw = true,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  reload_on_bufenter = false,
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = true,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
}
