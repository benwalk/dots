# ------------------------------------------------------------------------------
# Wrapper for `mvn` commands.
# - `-T 2C` enables multithreading, 2 threads per core
# ------------------------------------------------------------------------------
function mvn
  #complete --command mvn --arguments '(__fish_complete_directories)'
  command mvn -T 2C $argv
end
