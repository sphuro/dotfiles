if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
    alias nv="nvim"
    alias ls="exa --icons"
    alias ll="exa -lah --icons --color=always --group-directories-first -F"
    alias tree="exa --tree --icons"
    # alias where="which"
    # alias install="sudo pacman -S"
    # alias update="sudo pacman -Syu"
    alias enable="systemctl enable"
    alias start="systemctl start"
    alias disable="systemctl disable"
    # alias uninstall="sudo pacman -R"
    alias faf="fastfetch --logo-width 45 --logo-height 26 --logo ~/.config/fastfetch/wallpaper/bwcypher.jpg"
    set -U fish_user_paths $HOME/.local/share/gem/ruby/3.2.0/bin $fish_user_paths
    set -x OCC_INCLUDE_DIR /path/to/occ/include
    set -x OCC_LIBRARY_DIR /path/to/occ/lib
    #Exec=env LD_PRELOAD=/usr/lib/libfreetype.so.6 

end
