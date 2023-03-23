congrats, benwalk, you have a new mac! let's get it set up.

this repo will do the heavy lifting for you as long as you remember to keep it updated. but you'll need to get this repo onto your new mac first.
1. open terminal -> `xcode-select --install` - this will get you `git`, and some other CLI tools required for homebrew
2. install homebrew with `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` or whatever's the latest on their homepage
3. install github cli: `brew install gh`
4. authenticate github cli: `gh auth` and go through the login steps via HTTP
5. create your repospace: `mkdir ~/repos && cd ~/repos`
6. clone this repo: `gh repo clone dots`

past benwalk has already done the rest of your setup for you. thanks, past benwalk!
1. `sh bootstrap.sh`
