#!/bin/bash
#This script creates a build of the source code for a project.
#It copies files from a source directory to a build directory.
#It only copies files necessary for the release version.
#Information that needs to be kept private is not copied over to the build directory.
#The script is based on the "Build a Build Script" project in the Codecademy course "Learn Bash Scripting." 
#Created June 5, 2022 by E. Farrell. 
echo "Welcome User!"
firstline=$(head -n 1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "You are building version" $version
echo 'Do you wish to continue? (enter "1" for yes, "0" for no)'
read versioncontinue
if [ $versioncontinue -eq 1 ]
then
  echo "OK"
  for filename in source/*
  do
    if [ "$filename" == "source/secretinfo.md" ]
    then
      echo $filename "is not being copied"
    else
      echo $filename "is being copied"
      cp $filename build/
    fi
  done
  cd build/
  echo "Build version $version contains:"
  ls
  cd ..
else
  echo "Please come back when you are ready"
fi
