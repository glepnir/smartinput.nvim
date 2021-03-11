# smartinput.nvim

smart input

# usage

```lua
require('smartinput').setup {
  -- your rule here
  ['go'] = { ';',':=',';'}
}
```

then type `;` in go file you will see `:=` then type `;` you will see `;`
