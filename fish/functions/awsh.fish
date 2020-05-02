# Starts a fish shell wrapping all commands with aws-vault as the provided profile
function awsh
  aws-vault exec $argv[1] fish
end
