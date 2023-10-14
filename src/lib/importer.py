import os
import shutil
import stat
import git

from lib.logger import info_log, warn_log


def delete_everything_inside_folder(folder):
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

    info_log("All files and folders successfully deleted from '{}'".format(folder))


def import_source(import_identifier: str, source_dir: str = ".source"):
    full_path = "{}/{}".format(source_dir, import_identifier)

    if os.path.exists(source_dir) is False:
        info_log("'{}' does not exist, creating directory".format(source_dir))
        os.makedirs(source_dir, exist_ok=True)

    if os.path.exists(full_path) is False:
        info_log("'{}' does not exist, creating directory".format(full_path))
        os.makedirs(full_path, exist_ok=True)

    info_log("Attempting to determine if '{}' is a git repository".format(full_path))
    try:
        _ = git.Repo(full_path).git_dir
        warn_log("'{}' is a git repository".format(full_path))

        info_log("Reset the repository to make sure there is no changes ...")
        git.Repo(full_path).git.reset('--hard')

        info_log("Pulling the latest from the `master` branch ...")
        git.Repo(full_path).remotes.origin.pull()

    except git.exc.InvalidGitRepositoryError:
        warn_log("'{}' is NOT a git repository".format(full_path))
        info_log("Attempting to clean the folder ...".format(full_path))
        delete_everything_inside_folder(full_path)

        repo_url: str = 'git@github.com:NoX-Scripts-and-Things/{}.git'.format(import_identifier)
        info_log("Attempting to clone the github repository '{}'".format(repo_url))
        git.Repo.clone_from(repo_url, full_path)

    info_log("Successfully imported '{}'\n".format(import_identifier))


if __name__ == "__main__":
    import_source("fivem-nox-core", ".template/.source")
    import_source("fivem-nox-server", ".template/.source")
    import_source("fivem-nox-testing-suite", ".template/.source")
    import_source("fivem-nox-public", ".template/.source")
