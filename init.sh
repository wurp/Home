cd $(dirname $0)

echo Pulling all repositories
init/pull-all-repos.sh

for dir in build/local-repo-copies/*
do
  pushd "$dir" > /dev/null

  if [ -f ./init.sh ]
  then
    if [ -x ./init.sh ]
    then
      echo "Initializing $dir"
      ./init.sh
    else
      echo $PWD/init.sh exists but is not executable
    fi
  else
    echo "No init.sh for $dir"
  fi
  popd > /dev/null

  echo
  echo
done
