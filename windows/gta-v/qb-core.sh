# git init

# mkdir -p .source
# git clone git@github.com:NoX-Scripts-and-Things/fivem-nox-public.git .source/fivem-nox-public


pip3 install virtualenv

# (
#   cd ./.source/fivem-nox-public || exit 1
#   python3 -m venv venv
#   source venv/Scripts/activate
#   pip install -r "requirements.txt"
#   GIT_PYTHON_GIT_EXECUTABLE="/mingw64/bin/git" python init.py "qb-core"
# )

(
  cd ./.source/fivem-nox-server || exit 1
  python3 -m venv venv
  source venv/Scripts/activate
  pip install -r "requirements.txt"
  cd ../..
  ./.source/fivem-nox-server/src/build-server.sh
)

# (
#   cd ./.source/fivem-nox-testing-suite || exit 1
#   python3 -m venv venv
#   source venv/Scripts/activate
#   pip install -r "requirements.txt"
# )

# (
#   cd ./.source/fivem-nox-core || exit 1
#   python3 -m venv venv
#   source venv/Scripts/activate
#   pip install -r "requirements.txt"
# )



# if [ "$1" == "copy-server-files" ]; then
#   /usr/bin/cp start-server.sh ../../start-server.sh
#   /usr/bin/cp build-server.sh ../../build-server.sh
# fi
