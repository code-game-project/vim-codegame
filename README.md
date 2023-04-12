# vim-codegame
![CGE Version](https://img.shields.io/badge/CGE-v0.5-green)

A vim plugin for writing [CodeGame](https://github.com/code-game-project) applications.

## Features

- Syntax highlighting and indenting for `.cge` files

## Installation

### vim-plug

```vim
Plug 'code-game-project/vim-codegame'
```

## Activate LSP

The [CodeGame CLI](https://github.com/code-game-project/codegame-cli) includes a built-in CGE language server: `codegame lsp cge`

### coc.nvim

To register the language server using [coc.nvim](https://github.com/neoclide/coc.nvim) paste the following snippet into [`coc-settings.json`](https://github.com/neoclide/coc.nvim/wiki/Language-servers#register-custom-language-servers):
```json
{
  "languageserver": {
    "cge-ls": {
      "command": "codegame lsp cge",
      "filetypes": ["cge"],
      "rootPatterns": [".git/", "."]
    }
  }
}
```

### lspconfig setup

To register the language server using [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) paste the following
snippet into your `init.lua` (you may need to tweak it a bit to make it fit with the rest of your config, e.g. pass some options to `lspconfig.cge.setup{}`):

```lua
local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')
configs.cge = {
	default_config = {
		cmd = { "codegame", "lsp", "cge" },
		root_dir = lspconfig.util.root_pattern('.git'),
		single_file_support = true,
		filetypes = { 'cge' },
		init_options = {
			command = {'codegame', 'lsp', 'cge'},
		},
	},
}
lspconfig.cge.setup{}
```


## License

MIT License

Copyright (c) 2022-2023 Julian Hofmann

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
