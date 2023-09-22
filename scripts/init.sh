git init

# Create the source directory if it does not exist, this will contain all the boilerplate for the project but no directly
# required when used on your fivem server
if [ ! -d ".source" ]; then
  mkdir -p ".source"
fi

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

# Execute boilerplate, if the fx-manifest.lua does not exist then a boilerplate framework will be generated
source ./.source/fivem-nox-public/scripts/create-starter-code.sh

./fivem-nox-testing-suite.sh
./fivem-nox-core.sh
./fivem-nox-server.sh