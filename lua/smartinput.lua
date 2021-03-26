local sinput = {}
local api = vim.api

local delete_chars = function (times)
  local delete = '<BS>'
  local key = api.nvim_replace_termcodes(delete,true,true,true)
  return string.rep(key,times)
end

function _G.smart_input_loop(loop1,loop2)
  local col = api.nvim_win_get_cursor(0)[2]
  local content = api.nvim_get_current_line()
  local pchars1 = content:sub(col - #loop1 + 1,col)
  local pchars2 = content:sub(col - #loop2 + 1,col)

  if pchars1 == loop1 then
    return delete_chars(#loop1) .. loop2
  end
  if pchars2 == loop2 then
    return delete_chars(#loop2) .. loop1
  end
  if pchars1 ~= loop1 and pchars2 ~= loop2 then
    return loop1
  end
end

function sinput.setup(rules)
  vim.validate {
    rules = { rules , 't'}
  }

  local head = "autocmd Filetype "
  local lhs = " inoremap <buffer><expr> "
  local rhs = " v:lua.smart_input_loop('"
  local tail = "')"

  for ft,rule in pairs(rules) do
    local input,loop1,loop2 = rule[1],rule[2],rule[3]
    local str = head ..ft ..lhs..input..rhs..loop1 .."','"..loop2..tail
    vim.cmd(str)
  end
end

return sinput
