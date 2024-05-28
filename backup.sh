#!/bin/bash

# Halt the script on any errors.
set -e

# This would be the path to your external HD or wherever you're backing up
# your files. If you're on WSL, all of your drives can be found in /mnt but if
# follow my above blog post on setting up WSL, you can have them get mounted
# directly to /e or /f rather than /mnt/e or /mnt/f.
target_path="/home/Backup"

# Create the target path if it doesn't exist. This command is smart enough to
# not do anything if it already exists, which is important for later because
# we'll be running this script on an automated schedule.
# mkdir -p "${target_path}"

# A list of absolute paths to backup. In the case of WSL, ${HOME} is inside of
# the WSL file system. This is where most of your dotfiles would be located.
#
# The /e paths happens to be an internal HD I use to store all of my data.
include_paths=(
  "/home/data/Docs"
  "/home/data/Music"
  "/home/data/Pictures"
  "/home/data/projects"
  "/home/data/*.*"
  
)

# A list of folder names and files to exclude. There's no point backing up
# massive folders such as node_modules, plus you'll likely end up getting max
# file path copy errors because npm nests directories so deep it breaks Windows.
exclude_paths=(
  ".asset-cache"
  ".bundle"
  ".jekyll-cache"
  ".tweet-cache"
  ".vagrant"
  "_site"
  "node_modules"
  "tmp"
  "/boot/efi"
)

# rsync allows you to exclude certain paths. We're just looping over all of the
# excluded items and build up separate --exclude flags for each one.
for item in "${exclude_paths[@]}"
do
  exclude_flags="${exclude_flags} --exclude=${item}"
done

# rsync allows you to pass in a list of paths to copy. It expects a space separated
# string, so that's what we're building up here.
for item in "${include_paths[@]}"
do
  include_args="${include_args} ${item}"
done

# Finally, we just run rsync with a few flags:
#  -a is archive mode so it keeps your original created and modified properties.
#  -v is verbose mode to get a bit of extra output (useful for debugging).
#  -R is relative mode. It ensures the included paths get created on the target.
#  --dry-run ensures nothing gets written to the target (for testing purposes).
rsync -avrq  ${exclude_flags} ${include_args} ${target_path}
