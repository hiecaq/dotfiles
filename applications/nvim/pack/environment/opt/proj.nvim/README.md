Proj.nvim
====================

Requirement
----------------

This plugin requires neovim with `pynvim`.

Configurations
----------------

```vim
if has("nvim") && has("python3")
    packadd! proj.nvim
    call proj#markers#set({
                \ '_': ['.git', '.projectile', 'README.md', 'Makefile'],
                \ 'rust': ['Cargo.toml'],
                \ 'javascript': ['package.json'],
                \ })
endif
```

Usage
--------------

This plugin is meant to provide a minimal functionality out of the box.
Currently there is only a single function implemented: `proj#root()`, which
returns the found root directory of the current active file.

You can do some interesting things with it like:

```vim
nnoremap <silent> <Leader>df :call execute("Denite file/rec:" . proj#root())<CR>
nnoremap <silent> <Leader>F :call execute('Defx -split=floating -resume ' . proj#root())<CR>
```

Rationale
--------------

I just want some simple utility that helps find the root of the current project
and put its path here and there, that didn't come with any fancy
functionalities that I don't actually need.

FAQ
--------------

**Q**: is this plugin useful?

**A**: No. It's just for my personal need. But you are welcome to use it.
I'd recommend try something more mature, like [projectile.nvim][pn],
[vim-rooter][vr], etc.

[pn]: https://github.com/dunstontc/projectile.nvim
[vr]: https://github.com/airblade/vim-rooter

License
--------------

MIT
