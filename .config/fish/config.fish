set fish_user_paths $HOME/.bin $HOME/.npm-global/bin /snap/bin
set NPM_CONFIG_PREFIX $HOME/.npm-global
set EDITOR vim

function fish_greeting
end

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
end
