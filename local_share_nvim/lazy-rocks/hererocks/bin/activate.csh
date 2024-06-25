which deactivate-lua >&/dev/null && deactivate-lua

alias deactivate-lua 'if ( -x '\''/home/hayt/.local/share/nvim/lazy-rocks/hererocks/bin/lua'\'' ) then; setenv PATH `'\''/home/hayt/.local/share/nvim/lazy-rocks/hererocks/bin/lua'\'' '\''/home/hayt/.local/share/nvim/lazy-rocks/hererocks/bin/get_deactivated_path.lua'\''`; rehash; endif; unalias deactivate-lua'

setenv PATH '/home/hayt/.local/share/nvim/lazy-rocks/hererocks/bin':"$PATH"
rehash
