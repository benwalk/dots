function repo
    set -l repo_base ~/repos
    set -l repo_path (find "$repo_base" -mindepth 2 -maxdepth 2 -type d -name "*$argv*" | head -n 1)
    if not test "$argv"
        echo "Switched to repos directory."
        cd "$repo_base"
    else if not test "$repo_path"
        echo "None found."
    else
        echo "Switched to $repo_path."
        cd "$repo_path"
    end
end
