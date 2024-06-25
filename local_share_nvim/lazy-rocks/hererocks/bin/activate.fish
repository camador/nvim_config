if functions -q deactivate-lua
    deactivate-lua
end

function deactivate-lua
    if test -x '/home/hayt/.local/share/nvim/lazy-rocks/hererocks/bin/lua'
        eval ('/home/hayt/.local/share/nvim/lazy-rocks/hererocks/bin/lua' '/home/hayt/.local/share/nvim/lazy-rocks/hererocks/bin/get_deactivated_path.lua' --fish)
    end

    functions -e deactivate-lua
end

set -gx PATH '/home/hayt/.local/share/nvim/lazy-rocks/hererocks/bin' $PATH
