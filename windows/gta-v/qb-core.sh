mkdir -p .source
git init
git clone git@github.com:NoX-Scripts-and-Things/fivem-nox-public.git .source/fivem-nox-public
cd ./.source/fivem-nox-public || exit 1
./src/prepare-env.sh
GIT_PYTHON_GIT_EXECUTABLE="/mingw64/bin/git" python init.py "qb-core"
cd ../fivem-nox-server || exit 1
./../fivem-nox-public/src/prepare-env.sh
cd ../..
./.source/fivem-nox-server/src/build-server.sh


# if [ "$1" == "copy-server-files" ]; then
#   /usr/bin/cp start-server.sh ../../start-server.sh
#   /usr/bin/cp build-server.sh ../../build-server.sh
# fi
