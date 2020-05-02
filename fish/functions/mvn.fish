# ------------------------------------------------------------------------------
# Wrapper for `mvn` commands.
# - `-T 2C` enables multithreading, 2 threads per core
# - `-Xmx4g` sets max heap size to 4G
# - `-Xms512m` sets initial and min heap size to 512M
# - `-XX:+UseG1GC` enables the garbage-first (G1) collector
# - `-XX:+TieredCompilation` enables tiered compilation
# - `-XX:+TieredStopAtLevel=1`
# ------------------------------------------------------------------------------
function mvn
  #complete --command mvn --arguments '(__fish_complete_directories)'
  command mvn -T 2C -Xmx4g -Xms512m -Xss32m -XX:+UseG1GC -XX:+TieredCompilation -XX:TieredStopAtLevel=1 $argv
end
