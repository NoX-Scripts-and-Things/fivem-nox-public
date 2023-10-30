import os

# Because we are using the public scripts in mod folder the path will change
# Thus first we attempt to import the mod folder path if no then use the local path for testing the script
try:
    from lib.logger import Logger
except ModuleNotFoundError:
    from logger import Logger

from typing import Optional
from dotenv import load_dotenv
from pathlib import Path
from colorama import Fore


# Determine if a framework exists then loads it
# The framework will be stored in a cache folder usually called .source
# If it is in there then we will load it from there
# If it is not then we will make sure you pass a framework identifier to this function then
# write it to a cache file to reuse in the future. This means you only
# have to define the framework once, and it will be cached for other functions
# We attempt to get the framework from the ENV VARIABLE FRAMEWORK
def cache_framework(framework_identifier: Optional[str] = None,
                    source_dir: str = ".source") -> Optional[str]:
    logger = Logger("FRAMEWORK", Fore.LIGHTMAGENTA_EX)
    logger.info("Attempting to cache or load a cached version of the framework ...")

    # Define the source directory and framework file
    framework_file: str = "{}/.framework".format(source_dir)

    # Load environment variables from .env file if it exists
    dotenv_path = Path(framework_file)
    load_dotenv(dotenv_path=dotenv_path)

    # Retrieve an existing framework from the .env file
    framework: Optional[str] = os.getenv('FRAMEWORK')

    # If we were able to load the framework from the .env
    # If the framework directory also exists
    if framework is not None and os.path.exists(framework_file):
        logger.info("Cached Framework detected: '{}'".format(framework))
        return framework

    # We need to work in the source dir so need to make sure it exists
    if os.path.exists(source_dir) is False:
        logger.info("Source directory does not exist, creating dir ...")
        os.makedirs(source_dir, exist_ok=True)

    if framework_identifier is not None:
        logger.info("Setting framework to '{}'".format(framework_identifier))
        logger.info("Writing framework to cache '{}'".format(framework_file))
        f = open(framework_file, "w+")
        f.write("FRAMEWORK=\"{}\"".format(framework_identifier))
        f.close()
        logger.info("Framework successfully set to '{}'".format(framework_identifier))
        return framework_identifier

    return logger.fatal("Unable to determine framework!")


# Test this script with a qb-core framework
if __name__ == "__main__":
    cache_framework("qb-core", ".template/.source")
