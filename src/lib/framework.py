import os

from lib.logger import Logger
from typing import Optional
from dotenv import load_dotenv
from pathlib import Path
from colorama import Fore


# Determine the framework and load it
# If not defined yet set it and save it to a cache, if it is already defined then reload the cache
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
        logger.info("Framework successfully set to '{}'".format(framework_identifier))
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


if __name__ == "__main__":
    cache_framework("qb-core", ".template/.source")
