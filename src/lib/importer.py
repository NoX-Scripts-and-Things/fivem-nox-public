# Because we are using the public scripts in mod folder the path will change
# Thus first we attempt to import the mod folder path if no then use the local path for testing the script
try:
    from lib.logger import Logger
except ModuleNotFoundError:
    from logger import Logger

import os
import shutil
import stat
import git

from colorama import Fore

main_git_repo: str = "git@github.com:NoX-Scripts-and-Things"


# Delete all files and folders inside a folder
# If there is a permission error, try to change the file permissions and try again
# This is a fix for deleting .git folders
def empty_folder(logger: Logger, folder: str):
    # Permissions fix
    def onerror(func, path, _):
        # Handle errors, including those for hidden files or directories
        if not os.access(path, os.W_OK):
            os.chmod(path, stat.S_IWUSR)
            func(path)
        else:
            raise

    for filename in os.listdir(folder):
        file_path = os.path.join(folder, filename)
        try:
            if os.path.isfile(file_path) or os.path.islink(file_path):
                os.unlink(file_path)
            elif os.path.isdir(file_path):
                shutil.rmtree(file_path, onerror=onerror)
        except Exception as e:
            print('Failed to delete %s. Reason: %s' % (file_path, e))

    logger.info("All files and folders successfully deleted from '{}'".format(folder))


git_source_import_color = Fore.LIGHTCYAN_EX


# We attempt to import a git repository source
# This allows a mod to import a git repository as a source using python
# These sources can be from testing, servers all the way to mod frameworks
# When the source is imported again it is updated
# You can almost see these a libraries on their own but some of them are core code for other code to work
def import_git_source(import_identifier: str,
                      source_dir: str = ".source"):
    global git_source_import_color

    # Change color on every import to make it easier to see for a lot of imports
    if git_source_import_color == Fore.LIGHTCYAN_EX:
        git_source_import_color = Fore.LIGHTMAGENTA_EX
    else:
        git_source_import_color = Fore.LIGHTCYAN_EX

    logger = Logger("IMPORT_SOURCE__{}".format(import_identifier.replace("-", "_").upper()), git_source_import_color)

    full_path = "{}/{}".format(source_dir, import_identifier)
    repo_url: str = '{}/{}.git'.format(main_git_repo, import_identifier)

    if os.path.exists(source_dir) is False:
        logger.info("'{}' does not exist, creating directory".format(source_dir))
        os.makedirs(source_dir, exist_ok=True)

    if os.path.exists(full_path) is False:
        logger.info("'{}' does not exist, creating directory".format(full_path))
        os.makedirs(full_path, exist_ok=True)

    logger.info("Attempting to determine if '{}' is a git repository".format(full_path))
    try:
        if len(os.listdir(full_path)) != 0:
            _ = git.Repo(full_path).git_dir
            logger.warn("'{}' is a git repository".format(full_path))

            logger.warn("Resetting the repository to make sure there is no changes ...")
            git.Repo(full_path).git.reset('--hard')

            logger.info("Pulling the latest from the `master` branch ...")
            git.Repo(full_path).remotes.origin.pull()
        else:
            logger.info("Attempting to clone the github repository '{}'".format(repo_url))
            git.Repo.clone_from(repo_url, full_path)

    except git.exc.InvalidGitRepositoryError:
        # If a folder already exists for the git repo, but it is not a git repo then we attempt to remove the content
        logger.warn("'{}' is NOT a git repository".format(full_path))
        logger.info("Attempting to clean the folder ...".format(full_path))
        empty_folder(logger, full_path)

        logger.info("Attempting to clone the github repository '{}'".format(repo_url))
        git.Repo.clone_from(repo_url, full_path)

    logger.info("Successfully imported '{}'".format(import_identifier))


# Test this script by importing git sources
if __name__ == "__main__":
    import_git_source("fivem-nox-core", ".template/.source")
    import_git_source("fivem-nox-server", ".template/.source")
    import_git_source("fivem-nox-testing-suite", ".template/.source")
    import_git_source("fivem-nox-public", ".template/.source")
