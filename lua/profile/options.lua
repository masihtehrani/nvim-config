-- Options
local options = {
    backup = false,
    writebackup = false,
    swapfile = false,
    relativenumber = true,
    number = true,
    clipboard = "unnamedplus",
    ignorecase = true,
    undofile = true,
    undodir = string.format("%s/.undodir", vim.env.HOME),
    encoding = "UTF-8",
    pastetoggle = "<F2>",
    shiftwidth = 2,
    expandtab = true,
    hlsearch = true,
    wrap = false,
    cursorline = true,
    pumheight = 10,
    conceallevel = 0,
    tabstop = 2,
    cmdheight = 2,
    splitright = true,
    splitbelow = true,
    termguicolors = true,
    background = "dark",
    list = true,
    mouse = 'a',
    listchars = {
        eol = "$",
        trail = "+",
        tab = "> "
    },
    -- shell = "/bin/bash",
    shell = "/usr/local/bin/zsh",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

--Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Autocommands
local autocmd = vim.api.nvim_create_autocmd

local long_text_files = vim.api.nvim_create_augroup("LongTextFiles", { clear = true })
autocmd(
    {
        "BufRead", "BufNewFile"
    },
    {
        group = long_text_files,
        pattern = { '*.md', "*.txt" },
        command = "set wrap",
    }
)

-- FZF
--vim.env.FZF_DEFAULT_COMMAND = "rg --files --hidden --follow --no-ignore-vcs --fixed-strings"
--vim.env.FZF_DEFAULT_OPTS = [[--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --bind ctrl-j:down,ctrl-k:up,ctrl-h:preview-down,ctrl-l:preview-up]]

-- Emmet
-- vim.g.user_emmet_leader_key = ","

-- Gitgutter
vim.g.gitgutter_git_executable = "/usr/local/bin/git"
-- vim.g.gitgutter_git_executable = "/usr/bin/git"

-- Dashboard
--vim.g.dashboard_default_executive = "fzf"

-- VimGo
vim.g.go_def_mode = 'gopls'
vim.g.go_info_mode = 'gopls'
vim.g.go_highlight_structs = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_function_parameters = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_generate_tags = 1
vim.g.go_highlight_format_strings = 1
vim.g.go_highlight_variable_declarations = 1
vim.g.go_highlight_variable_assignments = 1
vim.g.go_auto_type_info = 1
vim.g.go_fmt_autosave = 1
vim.g.go_mod_fmt_autosave = 1
vim.g.go_gopls_enabled = 1
vim.g.go_mod_fmt_autosave = 1
vim.g.go_imports_autosave = 1
vim.g.go_metalinter_autosave = 0
vim.g.go_metalinter_deadline = "5s"
vim.g.go_gopls_gofumpt = "v:true"
vim.g.go_fmt_command= "gofumpt"
vim.g.go_metalinter_command = "golangci-lint"
vim.g.go_metalinter_autosave_enabled = {all}
vim.g.go_metalinter_enabled = {all}
--vim.g.go_metalinter_autosave_enabled = {'asciicheck','bidichk','containedctx','cyclop','deadcode','decorder','depguard','dogsled','dupl','durationcheck','errcheck','errchkjson','errname','errorlint','execinquery','exhaustive','exhaustruct','exportloopref','forbidigo','forcetypeassert','funlen','gci','gochecknoglobals','gochecknoinits','gocognit','goconst','gocritic','gocyclo','godot','godox','goerr113','gofmt','gofumpt','goheader','goimports','gomnd','gomoddirectives','gomodguard','goprintffuncname','gosec','gosimple','govet','grouper','ifshort','importas','ineffassign','ireturn','lll','maintidx','makezero','misspell','nakedret','nestif','nilnil','nlreturn','nolintlint','nonamedreturns','nosprintfhostport','paralleltest','prealloc','predeclared','promlinter','revive','staticcheck','stylecheck','tagliatelle','tenv','testpackage','thelper','typecheck','unconvert','unused','varcheck','varnamelen','whitespace','wrapcheck'}
--vim.g.go_metalinter_enabled = {'asciicheck','bidichk','containedctx','cyclop','deadcode','decorder','depguard','dogsled','dupl','durationcheck','errcheck','errchkjson','errname','errorlint','execinquery','exhaustive','exhaustruct','exportloopref','forbidigo','forcetypeassert','funlen','gci','gochecknoglobals','gochecknoinits','gocognit','goconst','gocritic','gocyclo','godot','godox','goerr113','gofmt','gofumpt','goheader','goimports','gomnd','gomoddirectives','gomodguard','goprintffuncname','gosec','gosimple','govet','grouper','ifshort','importas','ineffassign','ireturn','lll','maintidx','makezero','misspell','nakedret','nestif','nilnil','nlreturn','nolintlint','nonamedreturns','nosprintfhostport','paralleltest','prealloc','predeclared','promlinter','revive','staticcheck','stylecheck','tagliatelle','tenv','testpackage','thelper','typecheck','unconvert','unused','varcheck','varnamelen','whitespace','wrapcheck'}
vim.g.syntastic_go_checkers = {'golint', 'govet', 'golangci-lint'}
vim.g.go_list_type = "quickfix"

--[[
the following code alternates between the tokyonight
and papercolor colorschemes using even or odd numbers
]]
math.randomseed(os.time()) --set seed to current time
local rand = math.random(1000)

if (rand % 2 == 0) then
    --Tokyonight
    vim.g.tokyonight_style = "night"
    vim.cmd 'colorscheme tokyonight'
else
    --PaperColor
    vim.cmd 'colorscheme PaperColor'
end

-- Set barbar's options
vim.g.bufferline = {
  -- Enable/disable animations
  animation = true,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = false,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enable/disable close button
  closable = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- Excludes buffers from the tabline
  exclude_ft = {'javascript'},
  exclude_name = {'package.json'},

  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = true,

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,

  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,
  insert_at_start = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = nil,
}
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'NvimTree' then
      require'bufferline.state'.set_offset(31, 'FileTree')
    end
  end
})

vim.api.nvim_create_autocmd('BufWinLeave', {
  pattern = '*',
  callback = function()
    if vim.fn.expand('<afile>'):match('NvimTree') then
      require'bufferline.state'.set_offset(0)
    end
  end
})
local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.state')

nvim_tree_events.on_tree_open(function ()
  bufferline_state.set_offset(31, "File Tree")
end)

nvim_tree_events.on_tree_close(function ()
  bufferline_state.set_offset(0)
end)
-- end barbe

-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        --['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native
require('telescope').load_extension 'fzf'

--Add leader shortcuts
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>sf', function()
  require('telescope.builtin').find_files { previewer = false }
end)
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>st', require('telescope.builtin').tags)
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>so', function()
  require('telescope.builtin').tags { only_current_buffer = true }
end)
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles)
--
-- LSP settings
local lspconfig = require 'lspconfig'
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wl', function()
    vim.inspect(vim.lsp.buf.list_workspace_folders())
  end, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>sO', require('telescope.builtin').lsp_document_symbols, opts)
  vim.api.nvim_buf_create_user_command(bufnr, "Format", vim.lsp.buf.formatting, {})
end
-- Enable the following language servers 
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
  "gopls",
  "bashls",
  "dockerls",
  "cmake",
  "golangci_lint_ls",
  "marksman",
  "sqlls", -- npm i -g sql-language-server
  "jsonls", -- npm i -g vscode-langservers-extracted
  "html", -- npm i -g vscode-langservers-extracted
  "pyright", --pip install pyright
  "vimls", -- npm install -g vim-language-server
  --"sumneko_lua", -- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run
  "tsserver" -- npm install -g typescript typescript-language-server
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  ensure_installed = {
  "bash",
  "cmake",
  "comment",
  "css",
  "dot",
  "go",
  "help",
  "hjson",
  "html",
  "java",
  "javascript",
  "jsdoc",
  "json",
  "json5",
  "latex",
  "lua",
  "lua",
  "markdown",
  "perl",
  "php",
  "phpdoc",
  "proto",
  "python",
  "regex",
  "r",
  "ruby",
  "rust",
  "scheme",
  "scss",
  "solidity",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "yaml",
  },
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      nome_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>g', vim.diagnostic.setloclist)

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
 cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
         require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
      {name = 'cmp_tabnine'},
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

local tabnine = require('cmp_tabnine.config')
tabnine:setup({
	max_lines = 1000;
	max_num_results = 20;
	sort = true;
	run_on_every_keystroke = true;
	snippet_placeholder = '..';
	ignored_file_types = { -- default is not to ignore
		-- uncomment to ignore in lua:
		-- lua = true
	};
	show_prediction_strength = false;
})
