if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    # set -g theme_welcome_message
    set -g fish_greeting
end

# Start tmux automatically if it's not already running
if type -q tmux
    # Check if we're not already inside a tmux session
    if not set -q TMUX
        tmux
    end
end


fish_add_path /home/zibadi/.local/bin
fish_add_path -g -p ~/flutter/bin


thefuck --alias | source
