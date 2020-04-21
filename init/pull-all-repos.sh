set -e
mydir=$(realpath $(dirname $0))

cd $mydir/..
mkdir -p build/local-repo-copies
cd build/local-repo-copies

mkdir -p ~/projects

for gitrepo in $(awk '{ print $1 }' "$mydir/git-repos.txt")
do
  reponame=$(echo "$gitrepo" | sed 's#.*/\([^/]*\).git$#\1#')
  if [ -e $reponame ]
  then
    echo "$reponame already pulled"
  else
    git clone $gitrepo
  fi

  if [ -e ~/projects/$reponame ]
  then
    echo "$reponame already in ~/projects"
  else
    ln -s $PWD/$reponame ~/projects/$reponame
  fi

  echo
  echo
done
