# ------------------------------------------------------------------------------
# Quickly open an editor for a configuration file.
# ------------------------------------------------------------------------------
function edit-config
  switch $argv[1]
    case fish
      if test $argv[2] = "-a"
        command open -a /Applications/Atom.app ~/.config/fish/config.fish
      else
        command vim ~/.config/fish/config.fish
      end

    case pgcli
      if test $argv[2] = "-a"
        command open -a /Applications/Atom.app ~/.config/pgcli/config
      else
        command vim ~/.config/pgcli/config
      end

    case profile
      if test $argv[2] = "-a"
        command open -a /Applications/Atom.app ~/.profile
      else
        command vim ~/.profile
      end

    case '*'
      echo "Try one of: fish, pgcli, profile"
    end
end
