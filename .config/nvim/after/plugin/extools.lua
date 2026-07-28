local elixir = require("elixir")
local elixirls = require("elixir.elixirls")

elixir.setup {
  nextls = {
    enable = false, -- defaults to false
    port = 9000, -- connect via TCP with the given port. mutually exclusive with `cmd`. defaults to nil
    cmd = "path/to/next-ls", -- path to the executable. mutually exclusive with `port`
    spitfire = true, -- defaults to false
    init_options = {
      mix_env = "dev",
      mix_target = "host",
      experimental = {
        completions = {
          enable = false -- control if completions are enabled. defaults to false
        }
      }
    },
    on_attach = function(client, bufnr)
      -- custom keybinds
    end
  },
  
  elixirls = {
    -- specify a repository and branch
    repo = "mhanberg/elixir-ls", -- defaults to elixir-lsp/elixir-ls
    branch = "mh/all-workspace-symbols", -- defaults to nil, just checkouts out the default branch, mutually exclusive with the `tag` option
    tag = "v0.14.6", -- defaults to nil, mutually exclusive with the `branch` option

    -- alternatively, point to an existing elixir-ls installation (optional)
    -- not currently supported by elixirls, but can be a table if you wish to pass other args `{"path/to/elixirls", "--foo"}`
    cmd = "elixir-ls",

	-- extension point to link in to server specific commands
	-- by default, the codelens action below runs a default test runner in a terminal buffer 
	-- replacing it as shown here will override default behavior, allow running a custom function instead
	-- `args` are anything the lsp command passes back to the callback function
	commands = {
      ["elixir.lens.test.run"] = function(args)
	    -- custom functionality here as needed
	  end
	},

    -- default settings, use the `settings` function to override settings
    settings = elixirls.settings {
      dialyzerEnabled = true,
      fetchDeps = false,
      enableTestLenses = false,
      suggestSpecs = false,
    },
    on_attach = function(client, bufnr)
      vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
      vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
      vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
    end
  }
}
