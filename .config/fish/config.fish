set EDITOR nvim
set NPM_CONFIG_PREFIX $HOME/.npm-global
set GOPATH $HOME/.go

alias vim nvim

set fish_user_paths $HOME/.bin $HOME/.npm-global/bin /var/lib/snapd/snap/bin /opt/cuda/bin $GOPATH $HOME/.cargo/bin

function fish_greeting
end
