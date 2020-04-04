set -e
mydir=$(realpath $(dirname $0))

cd $mydir
mkdir -p build/local-repo-copies
cd build/local-repo-copies

for file in $(awk '{ print $1 }' "$mydir/git-repos.txt")
do
  git clone $file
done
