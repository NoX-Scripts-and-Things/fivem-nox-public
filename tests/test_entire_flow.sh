TARGET_TEST_DIR="nox-flow-test"

# Attempt to run the entire initialization flow in a empty directory.
# This allows you to test if everything works
if [ -d "$TARGET_TEST_DIR" ]; then rm -Rf "$TARGET_TEST_DIR"; fi
mkdir "$TARGET_TEST_DIR"
cd $TARGET_TEST_DIR || exit 1

# Run the initialization script with qb-core as the base
curl -sSL https://raw.githubusercontent.com/NoX-Scripts-and-Things/fivem-nox-public/master/scripts/initialize.sh | bash -s -- init-base.py qb-core

# Remove the .gitignore file in the test directory and replace it with * to disable anything in that dir from being pushed to the repo as a .git is initialized in the test directory
rm -rf ".gitignore"
echo "*" > .gitignore