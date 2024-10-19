set -gx EDITOR nvim
set -gx DIFFPROG "nvim -d"
set -gx NPM_CONFIG_PREFIX $HOME/.npm-global
set -gx GOPATH $HOME/.go

#alias vim nvim

set fish_user_paths $HOME/.bin $HOME/.npm-global/bin /var/lib/snapd/snap/bin /opt/cuda/bin $GOPATH $HOME/.cargo/bin

if test -z "(pgrep ssh-agent)"
  eval (ssh-agent -c) > /dev/null
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
end

function fish_greeting
end
