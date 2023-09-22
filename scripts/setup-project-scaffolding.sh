# Create the source directory if it does not exist, this will contain all the boilerplate for the project but no directly
# required when used on your fivem server
if [ ! -d ".source" ]; then
  mkdir -p ".source"
fi

# Pull the fivem testing suite if it does not exist, this library is usually required by all scripts
if [ ! -d ".source/fivem-nox-testing-suite" ]
then
    echo "Nox core does not exist, pulling repository"
    cd .source || exit 1
    git clone git@github.com:NoX-Scripts-and-Things/fivem-nox-testing-suite.git
    cd .. || exit 1
else
  cd .source/fivem-nox-testing-suite || exit 1
  git pull origin master
  cd ../.. || exit 1
fi

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


# Pull the fivem nox public code, This is usually used to generate assets, boilerplate and framework things
if [ ! -d ".source/fivem-nox-public" ]
then
    echo "Nox public code does not exist, pulling repository"
    cd .source || exit 1
    git clone git@github.com:NoX-Scripts-and-Things/fivem-nox-public.git
    cd .. || exit 1
else
  cd .source/fivem-nox-public || exit 1
  git pull origin master
  cd ../.. || exit 1
fi

# Execute boilerplate, if the fxmanifest.lua does not exist then a boilerplate framework will be generated
source ./.source/fivem-nox-public/scripts/create-starter-code.sh
