# Pull the fivem nox core if it does not exist, this library is usually required by all scripts
if [ ! -d ".source/fivem-nox-core" ]
then
    echo "Nox core does not exist, pulling repository"
    cd .source || exit 1
    git clone git@github.com:NoX-Scripts-and-Things/fivem-nox-core.git
    cd .. || exit 1
else
  cd .source/fivem-nox-core || exit 1
  git pull origin master
  cd ../.. || exit 1
fi

# Run the nox-core init script to make sure we have all the assets
cd .source/fivem-nox-core || exit 1
./refresh-source.sh
cd ../..
