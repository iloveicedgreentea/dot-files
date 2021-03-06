# Quick file editing when needed
export EDITOR='vim'

# Set PATH
set PATH /usr/local/bin/ $PATH

# Configs for bobthefish
set -g fish_prompt_pwd_dir_length 10
set -g theme_display_k8s_context no
set -g theme_color_scheme dark
#set -g theme_display_user ssh
#set -g theme_display_hostname ssh

# Aliases

# Example - Set a context for multiple clients
#alias XYZ="source /Users/XYZ/some_context/env.sh"
#alias 123="source /Users/123/some_context/env.sh"

# Commands
alias kc='kubectl'
alias cd..="cd .."
alias gs="git status"
alias unset 'set --erase'

# Functions

# History
function search
  history | grep $argv
end

# Kube
function kcl
	kubectl logs $argv
end
function kce
	kubectl exec -it $argv bash
end
function kcgp
	kubectl get pods --sort-by=.status.startTime $argv
end
function kcgn
	kubectl get nodes
end
function kcgd
	kubectl get deploy $argv
end
function kcdp
	kubectl describe pods $argv
end
function kcdd
	kubectl describe deploy $argv
end
function kcdn
	kubectl describe node $argv
end

# General

function help
  echo "Kubernetes"
  echo '-------------'
  echo 'kcl $1 - logs'
  echo 'kce $1 - exec'
  echo 'kcgp $1 - get pod'
  echo 'kcdp $1 - describe deploy'
  echo 'kcgd $1 - get deploy'
  echo 'kcdd $1 - describe deploy'
  echo 'kcdn $1 - describe node'
  echo
  echo "Git"
  echo "---------"
  echo "Status: gs"
  echo
  echo "General"
  echo "---------"
  echo 'Search history: search $1'
  echo
end

# Uncomment if you want to use starship when fish starts. Personally, not a fan as it's pretty slow compared to using fish alone
#brew install starship
#starship init fish | source
