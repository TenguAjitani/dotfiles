return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  opts = function()
    local actions = require("fzf-lua.actions")
    local img_previewer = vim.fn.executable("ueberzug") == 1 and { "ueberzug" } or nil

    return {
      "default-title",
      fzf_colors = true,
      fzf_opts = {
        ["--no-scrollbar"] = true,
      },
      defaults = {
        formatter = "path.dirname_first",
      },
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept",
          ["ctrl-u"] = "half-page-up",
          ["ctrl-d"] = "half-page-down",
          ["ctrl-x"] = "jump",
          ["ctrl-f"] = "preview-page-down",
          ["ctrl-b"] = "preview-page-up",
          ["shift-up"] = "up",
          ["shift-down"] = "down",
        },
        builtin = {
          ["<c-f>"] = "preview-page-down",
          ["<c-b>"] = "preview-page-up",
          ["<S-j>"] = "down",
          ["<S-k>"] = "up",
        },
      },
      actions = {
        files = {
          ["enter"] = actions.file_edit_or_qf,
          ["alt-i"] = { actions.toggle_ignore },
          ["alt-h"] = { actions.toggle_hidden },
        },
      },
      previewers = {
        builtin = {
          extensions = {
            ["png"] = img_previewer,
            ["jpg"] = img_previewer,
            ["jpeg"] = img_previewer,
            ["gif"] = img_previewer,
            ["webp"] = img_previewer,
            ["bmp"] = img_previewer,
            ["tiff"] = img_previewer,
            ["svg"] = img_previewer,
          },
          ueberzug_scaler = "fit_contain",
        },
      },
      ui_select = function(fzf_opts, items)
        return vim.tbl_deep_extend("force", fzf_opts, {
          prompt = " ",
          winopts = {
            title = " " .. vim.trim((fzf_opts.prompt or "Select"):gsub("%s*:%s*$", "")) .. " ",
            title_pos = "center",
          },
        }, fzf_opts.kind == "codeaction" and {
          winopts = {
            layout = "vertical",
            height = math.floor(math.min(vim.o.lines * 0.8 - 16, #items + 2) + 0.5) + 16,
            width = 0.5,
            preview = not vim.tbl_isempty(vim.lsp.get_clients({ bufnr = 0, name = "vtsls" })) and {
              layout = "vertical",
              vertical = "down:15,border-top",
              hidden = "hidden",
            } or {
              layout = "vertical",
              vertical = "down:15,border-top",
            },
          },
        } or {
          winopts = {
            width = 0.5,
            height = math.floor(math.min(vim.o.lines * 0.8, #items + 2) + 0.5),
          },
        })
      end,
      winopts = {
        width = 0.8,
        height = 0.8,
        row = 0.5,
        col = 0.5,
        preview = {
          scrollchars = { "┃", "" },
        },
        on_create = function()
          vim.keymap.set("t", "<S-j>", "<Down>", { buffer = true, silent = true })
          vim.keymap.set("t", "<S-k>", "<Up>", { buffer = true, silent = true })
        end,
      },
      files = {
        cwd_prompt = false,
        cmd = vim.fn.executable("fd") == 1 and "fd" or nil,
        find_opts = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
        rg_opts = "--color=never --files --hidden --follow -g '!.git'",
        fd_opts = "--color=never --type f --hidden --follow --exclude .git",
        actions = {
          ["enter"] = actions.file_edit_or_qf,
          ["alt-i"] = { actions.toggle_ignore },
          ["alt-h"] = { actions.toggle_hidden },
        },
      },
      grep = {
        cmd = vim.fn.executable("rg") == 1 and "rg" or "grep",
        grep_opts = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp -e",
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e",
        rg_glob = true,
        glob_flag = "--iglob",
        glob_separator = "%s%-%-",
        actions = {
          ["alt-i"] = { actions.toggle_ignore },
          ["alt-h"] = { actions.toggle_hidden },
        },
      },
      live_grep = {
        cmd = vim.fn.executable("rg") == 1 and "rg" or "grep",
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096",
      },
      lsp = {
        symbols = {
          symbol_hl = function(s)
            return "TroubleIcon" .. s
          end,
          symbol_fmt = function(s)
            return s:lower() .. "\t"
          end,
          child_prefix = false,
        },
        code_actions = {
          previewer = vim.fn.executable("delta") == 1 and "codeaction_native" or nil,
        },
      },
    }
  end,
  config = function(_, opts)
    vim.env.VIPS_WARNING = "0"
    vim.env.G_MESSAGES_DEBUG = ""
    vim.env.VIPS_NOVIPS = "1"

    require("fzf-lua").setup(opts)

    local keymap = vim.keymap.set
    keymap("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find Files 󰭎 " })
    keymap("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Live Grep  " })
    keymap("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Find Buffers  " })
    keymap("n", "<leader>fh", "<cmd>FzfLua help_tags<cr>", { desc = "Help Tags 󰅴 " })
    keymap("n", "<leader>fe", "<cmd>FzfLua files<cr>", { desc = "File Browser  " })
  end,
}
