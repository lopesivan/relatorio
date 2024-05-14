#!/usr/bin/env bash

####
#
# $1 = Remote URL to be clonned
# $2 = New name of the repository
#
####

remote=${HOME}/eletrica/repo/02-relatorio.git
repository=relatorio
workdir=$(pwd)
destination="$workdir/$repository"

echo "Creating repository at $destination"
mkdir "$destination"

git clone "$remote" "$repository"
cd "$repository"

for branch in $(git ls-remote --heads origin | grep -o "refs/heads/.*$" | cut -d / -f 3-); do
	echo "Cloning into branch $branch"
	git clone -b $branch --single-branch $remote "$destination/$branch"
done

echo "Current dir: $(pwd)"
echo "Deleting all .git and .gitignore files"

rm -rf "$destination"/*/.gitignore
rm -rf "$destination"/*/.git
rm -rf "$destination"/.gitignore
rm -rf "$destination"/.git
