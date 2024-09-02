return { 
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require"nvim-ts-autotag".setup{}
		end
	},
	{	
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require 'nvim-treesitter.configs'.setup {
				--  --ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "cpp", "css", "bash", "html", "json", "scss", "svelte", "typescript" },
				sync_install = false,
				auto_install = true,

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				}
			}

		end
	}
}
