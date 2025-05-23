local Hydra = require('hydra')
local splits = require('smart-splits')

local window_hint = [[
 ^^^^^^^^^^^^     Move      ^^    Size   ^^   ^^     Split
 ^^^^^^^^^^^^-------------  ^^-----------^^   ^^---------------
 ^ ^ _k_ ^ ^  ^ ^ _K_ ^ ^   ^   _<C-k>_   ^   _s_: horizontally 
 _h_ ^ ^ _l_  _H_ ^ ^ _L_   _<C-h>_ _<C-l>_   _v_: vertically
 ^ ^ _j_ ^ ^  ^ ^ _J_ ^ ^   ^   _<C-j>_   ^   _q_, _c_: close
 focus^^^^^^  window^^^^^^  ^_=_: equalize^   _z_: maximize
 ^ ^ ^ ^ ^ ^  ^ ^ ^ ^ ^ ^   ^^ ^          ^   _o_: remain only
 _b_: choose buffer
]]

Hydra({
name = 'Windows',
hint = window_hint,
config = {
        invoke_on_body = true,
        hint = {
                border = 'rounded',
                offset = -1
        }
},
mode = 'n',
body = '<C-w>',
heads = {
      { 'h', '<C-w>h' },
      { 'j', '<C-w>j' },
      { 'k', '<C-k>k' },
      { 'l', '<C-w>l' },
      
      { 'H','<C-w>H'},
      { 'J','<C-w>J'},
      { 'K','<C-w>K'},
      { 'L','<C-w>L'},
      
      { '<C-h>', function() splits.resize_left(2)  end },
      { '<C-j>', function() splits.resize_down(2)  end },
      { '<C-k>', function() splits.resize_up(2)    end },
      { '<C-l>', function() splits.resize_right(2) end },
      { '=', '<C-w>=', { desc = 'equalize'} },
      
      { 's',     pcmd('split', 'E36') },
      { '<C-s>', pcmd('split', 'E36'), { desc = false } },
      { 'v',     pcmd('vsplit', 'E36') },
      { '<C-v>', pcmd('vsplit', 'E36'), { desc = false } },

      { 'w',     '<C-w>w', { exit = true, desc = false } },
      { '<C-w>', '<C-w>w', { exit = true, desc = false } },

      { '<Esc>', nil,  { exit = true, desc = false } },
      }
})
