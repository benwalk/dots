function symlink
  --wraps=ln
  --description="Creates a symlink at $location pointing at $target."
  --argument-names location target

  set -lx location ""
  #symlink() {
  #    OVERWRITTEN=""
  #    if [ -e "$2" ] || [ -h "$2" ]; then
  #        OVERWRITTEN="(Overwritten)"
  #        if ! rm -r "$2"; then
  #            substep_error "Failed to remove existing file(s) at $2."
  #        fi
  #    fi
  #    if ln -s "$1" "$2"; then
  #        substep_success "Symlinked $2 to $1. $OVERWRITTEN"
  #    else
  #        substep_error "Symlinking $2 to $1 failed."
  #    fi
end
