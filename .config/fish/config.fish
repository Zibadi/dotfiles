if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    # set -g theme_welcome_message
    set -g fish_greeting
end

fish_add_path /home/zibadi/.local/bin
fish_add_path -g -p ~/flutter/bin

