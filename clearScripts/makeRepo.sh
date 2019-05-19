#!/bin/bash

# clear out old rpms
echo
echo "Deleting all rpms in current directory"
rm -fv *.rpm
echo "Deleting old repo data"
rm -rfv repodata

# get rpm files from clearlinux dir if it exists
shopt -s globstar
RPMDIR=~/clearlinux/packages/
if [ -d "$RPMDIR" ]; then

    # copy the rpm's here
  echo "Copying rpm files to this directory"  
  cp ~/clearlinux/packages/**/rpms/*.rpm .


  REPONAME="mylocal"
  # delete the repo if it is there
  echo "Removing current repository data.(admin permissions)"
  sudo mixin repo remove $REPONAME

  # delete old bundles (you will have to regenerate
  #echo "Deleting old bunldes, admin permissions are required"
  #shopt -s extglob   
  #sudo rm  -vrf !("/usr/share/mix/local-bundles/localrepo") 

  # add it back
  echo "Initializing repository"
  createrepo_c .
  sudo mixin repo add $REPONAME file://$HOME/localrepo/

  echo
  echo "Run 'sudo mixin package add PackageName --bundle BundleName' to add new packages"
  echo "Then 'sudo mixin build' to build it"
  echo "To migrate, do this: 'sudo swupd check-update'"
  echo "'sudo swupd update --migrate'"
  echo "'sudo swupd check-update'"
  exit
fi

echo "$RPMDIR does not exist, exiting"

