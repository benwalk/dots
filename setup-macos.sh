#-------------------------------------------------------------------------------
#  System Preferences
#  Found a bunch here: https://macos-defaults.com/
#-------------------------------------------------------------------------------

# set dock to left
defaults write com.apple.dock "orientation" -string "right"
# set dock icon size to smaller
defaults write com.apple.dock "tilesize" -int "36"
# autohide the dock
defaults write com.apple.dock "autohide" -bool "true"
# removes the dock hide animation
defaults write com.apple.dock "autohide-time-modifier" -float "0"
# only show the doc after mouse hasn't moved for 30 seconds (e.g., I don't really want to ever see the dock)
defaults write com.apple.dock "autohide-delay" -float "30"
# do not show recently used apps dock section
defaults write com.apple.dock "show-recents" -bool "false"
# set window minimize effect to suck
defaults write com.apple.dock "mineffect" -string "suck"
# disable bouncing for attention
defaults write com.apple.dock "no-bouncing" -bool "false"
# only show active apps
defaults write com.apple.dock "static-only" -bool "true"

# disable screenshot shadows
defaults write com.apple.screencapture "disable-shadow" -bool "true"
# include datetime on screenshots
defaults write com.apple.screencapture "include-date" -bool "true"
# set screenshot location to "~/Pictures/Screenshots"
defaults write com.apple.screencapture "location" -string "~/Pictures/Screenshots"
# display thumbnail after taking screenshots
defaults write com.apple.screencapture "show-thumbnail" -bool "true"
# set screenshot format to png
defaults write com.apple.screencapture "type" -string "png"


# display quit option for Finder
defaults write com.apple.finder "QuitMenuItem" -bool "true"
# always show file extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
# show hidden files
defaults write com.apple.Finder "AppleShowAllFiles" -bool "true"
# disable warning when changing file extension in Finder
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"
# default new file save location is home directory
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"
# reduce the save dialog animation
defaults write NSGlobalDomain "NSWindowResizeTime" -float "0.001"
# remove delay when hovering the toolbar title
defaults write NSGlobalDomain "NSToolbarTitleViewRolloverDelay" -float "0"
# set sidebar icon to small
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "1"
# show external media on desktop
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool "true"
# show removable media on desktop
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "true"
# show full path in Finder title
defaults write com.apple.finder "_FXShowPosixPathInTitle" -bool "true"
# show path bar
defaults write com.apple.finder "ShowPathbar" -bool "true"
# show status bar
defaults write com.apple.finder "ShowStatusBar" -bool "true"
# show expanded save file menu always
defaults write NSGlobalDomain "NSNavPanelExpandedStateForSaveMode" -bool "true" && \
defaults write NSGlobalDomain "NSNavPanelExpandedStateForSaveMode2" -bool "true"
# set view style to columns
defaults write com.apple.finder FXPreferredViewStyle -string "Clmv"


# flash time separator every second
defaults write com.apple.menuextra.clock "FlashDateSeparators" -bool "true"
# add seconds to clock
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM j:mm:ss\""

# disable spaces rearranging
defaults write com.apple.dock "mru-spaces" -bool "false"

# set textedit to plaintext
defaults write com.apple.TextEdit "RichText" -bool "false"
# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain "NSAutomaticQuoteSubstitutionEnabled" -bool false
# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain "NSAutomaticDashSubstitutionEnabled" -bool false
# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# disable time machine prompting to use disks as backup
defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool "true"

# disable "application downloaded from internet" warning
defaults write com.apple.LaunchServices "LSQuarantine" -bool "false"


# always show scrollbars
defaults write NSGlobalDomain "AppleScrollBars" -string "Always"
# jump to click on scrollbars
defaults write NSGlobalDomain "AppleScrollerPagingBehavior" -bool "true"

# display additional info on login screen
defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# disable iCloud handoff
defaults -currentHost write "~/Library/Preferences/ByHost/com.apple.coreservices.useractivityd.plist" ActivityAdvertisingAllowed -bool "false"

# disable autocorrect
defaults write NSGlobalDomain "NSAutomaticSpellingCorrectionEnabled" -bool "false"

# set system sleep idle time to 1 hr
systemsetup -setcomputersleep 60

defaults -currentHost write com.apple.screensaver idleTime -int 0

defaults write NSGlobalDomain KeyRepeat -int 2 && defaults write NSGlobalDomain InitialKeyRepeat -int 15

###############################################################################
# Energy saving                                                               #
###############################################################################

# Enable lid wakeup
sudo pmset -a lidwake 1
# Restart automatically on power loss
sudo pmset -a autorestart 1
# Sleep the display after 15 minutes
sudo pmset -a displaysleep 15
# Disable machine sleep while charging
sudo pmset -c sleep 0
# Set machine sleep to 5 minutes on battery
sudo pmset -b sleep 5
# Set standby delay to 24 hours (default is 1 hour)
sudo pmset -a standbydelay 86400
# Hibernation mode
# 0: Disable hibernation (speeds up entering sleep mode)
# 3: Copy RAM to disk so the system state can still be restored in case of a
#    power failure.
sudo pmset -a hibernatemode 3

# Never go into computer sleep mode
sudo systemsetup -setcomputersleep Off > /dev/null
# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on


# Remove the sleep image file to save disk space
sudo rm /private/var/vm/sleepimage
# Create a zero-byte file instead…
sudo touch /private/var/vm/sleepimage
# …and make sure it can’t be rewritten
sudo chflags uchg /private/var/vm/sleepimage

###############################################################################
# Screen                                                                      #
###############################################################################

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Hot corners
# Possible values:
# 0: no-op
# 2: Mission Control
# 3: Show application windows
# 4: Desktop
# 5: Start screen saver
# 6: Disable screen saver
# 7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center

# Top left screen corner → Start screen saver
defaults write com.apple.dock wvous-tl-corner -int 5
defaults write com.apple.dock wvous-tl-modifier -int 0

# Top right screen corner → Desktop
defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.dock wvous-tr-modifier -int 0

# Bottom left screen corner → Show Application Windows
defaults write com.apple.dock wvous-bl-corner -int 3
defaults write com.apple.dock wvous-bl-modifier -int 0

# Bottom right screen corner → Mission Control
defaults write com.apple.dock wvous-bl-corner -int 2
defaults write com.apple.dock wvous-bl-modifier -int 0





#-------------------------------------------------------------------------------
# Kill affected apps
for app in "Dock" "Finder" "SystemUIServer"; do
  killall "${app}" > /dev/null 2>&1
done

# Done
echo "Done. Note that some of these changes require a logout/restart to take effect."
