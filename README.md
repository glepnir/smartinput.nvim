# smartinput.nvim

change your input char to any you want.

# usage

```lua
require('smartinput').setup {
  -- your rule here
  ['go'] = { ';',':=',';'}
}
```

# how it work

rule is  `['go'] = { ';',':=',';'}` . this rule mean you first type `;` in go 

file you will get `:=`,type `;` second you will get `;`.

