### Vim plugin for Valk language
https://github.com/valk-lang/valk

### 安装
Install using [Plug](https://github.com/junegunn/vim-plug)

```vim
" set $VALK_ROOT to vimrc or .zshrc, can use this plugin tags dict
" au FileType valk let $VALK_ROOT = ~/path/to/valk

Plug 'angluca/valk.vim'
```

### LSP setup
安装 [lsp](https://github.com/yegappan/lsp) using `Plug`

```vim
Plug 'yegappan/lsp'
```

Then add this to your `.vimrc`
```vim
setl omnifunc=LspOmniFunc
au filetype valk call LspAddServer([#{
            \    name: 'valk',
            \    filetype: ['valk'],
            \    path: 'valk',
            \    args: ['lsp','run']
            \  }])
```

quickly compile and run use `:make -r`

