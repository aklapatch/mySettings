#!/bin/bash

# clear out old rpms
echo
echo "Deleting all rpms in current directory"
rm -f *.rpm
echo "Deleting old repo data"
rm -rf repodata

# get rpm files from clearlinux dir if it exists
shopt -s globstar
RPMDIR=~/clearlinux/packages/
if [ -d "$RPMDIR" ]; then

    # copy the rpm's here
  echo "Copying rpm files to this directory"  
  cp ~/clearlinux/packages/**/rpms/*.rpm .

  # delete the repo if it is there
  echo "removing current repository data."
  sudo mixin repo remove mylocalrepo

  # add it back
  echo "Initializing repository"
  createrepo_c .
  sudo mixin repo add mylocalrepo file://$HOME/localrepo/

  echo
  echo "Run 'sudo mixin package add PackageName --bundle BundleName' to add new packages"
  echo "Then 'sudo mixin build' to build it"
  echo "To migrate, do this: 'sudo swupd check-update'"
  echo "'sudo swupd update --migrate'"
  echo "'sudo swupd check-update'"
  exit
fi

echo "$RPMDIR does not exist, exiting"

