Operator for toggling trailing symbols
================================================

This plugin defines two operator that toggles the existence of a particular symbol at the end of a motion or textobj. The implementation provides bindings for comma and semicolon, but one can easily add their own.

Requirements
----------------------

This plugin depends on [vim-operator-user](https://github.com/kana/vim-operator-user).

Example settings
----------------------

Put these in your `.vimrc`:

```vim
map <silent> ; <Plug>(operator-end-toggle-semicolon)
map <silent> , <Plug>(operator-end-toggle-comma)
```

Defining more operators
----------------------

You can define new operators that toggle some particular symbol with the following code:

```vim
call operator#user#define('end-toggle-sharp', 'operator#end#toggle', 'call operator#end#set_symbol("#")')
```

Rationale
----------------------

Consider the following C code:
```C
int f() {
    int x = 42
    return x;
}
```

The code won't compile since we missed a semicolon at the end of the second line. We can easily append a semicolon by `A`, however how about:

```C
int f() {
    int a = 1
    int b = 3
    int c = 6
    return a + b + c
}
```

This is likely to happen if you stay up late and somehow believe that you are writing in a language that doesn't require a semicolon to mark the end of a statement. If you want to repeat appending semicolon on each line, you might need to use macro or something more fancy. But with this plugin, you can simply do `;i{`, and you are free to move on.

Miscs
----------------------

This is my first Vim plugin, so the implementation might seems a little bit ugly. Any helps, found issues and PRs are appreciated.

TODO list:
- [ ] doc
- [ ] implementation for block-wise invocation

LICENSE
----------------------

MIT
