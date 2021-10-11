if status is-interactive
    # Commands to run in interactive sessions can go here
      # Start X at login
      if status is-login
       if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
       end
      end
end

# Install NVM manually (https://github.com/creationix/nvm)
# Install bass (https://github.com/edc/bass)
# Add code below to your config.fish

function nvm
   bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

nvm use default --silent
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

