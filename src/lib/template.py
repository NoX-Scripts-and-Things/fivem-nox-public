
# Because we are using the public scripts in mod folder the path will change
# Thus first we attempt to import the mod folder path if no then use the local path for testing the script
try:
    from lib.logger import Logger
    from lib.framework import cache_framework
except ModuleNotFoundError:
    from logger import Logger
    from framework import cache_framework

import os
import pathlib
import chevron

from os import path
from colorama import Fore


DEFAULT_TEMPLATE_DATA = {
    'debug': 'false',
    'script': {
        'author': 'NoX Script and Things',
        'description': 'Oh my word, another mod from NoX, Amazing ;)',
        'game': 'gta5',
        'has_server': True,
        'has_client': True,
        'modules': {
            'oxmysql',
            'fivem-nox-core',
            'qb-core'
        }
    },
    'server': {
        'name': 'Nox script',
        'description': 'Local server for testing Nox scripts',
        'tags': 'default',
        'build_hash': '6683-9729577be50de537692c3a19e86365a5e0f99a54',
        'game_build': 2944,
        'mysql_user': 'admin',
        'mysql_host': 'localhost',
        'mysql_database': 'fivem_nox',
        'mysql_password': 'admin123',
        'steam_api_key': '',
        'tebex_key': '',
        'fivem_license_key': '',
        'admin_steam_ids': '',
        'rcon_password': 'admin123',
        'endpoint_tcp': '0.0.0.0:30120',
        'endpoint_udp': '0.0.0.0:30120',
        'extra_ensure_normal_list': '',
        'extra_ensure_priority_list': '',
        'max_connections': 32,
        'custom_mods_directory_name': 'custom',
    }
}


# Generates a template for the current framework
# We use mustache templates for this
def template_generator(dest_directory: str = '.',
                       source_directory: str = '.source',
                       template_directory: str = '..\\templates\\{}',
                       force: bool = False,
                       template_data: dict = DEFAULT_TEMPLATE_DATA):
    logger = Logger("TEMPLATE", Fore.LIGHTBLUE_EX)

    logger.info("Attempting to generate a template for the current framework ...")

    logger.info("Fetching cached framework ...")
    detected_framework = cache_framework(source_dir=source_directory)
    if detected_framework is None:
        return logger.fatal("Unable to determine framework!")
    else:
        logger.info("Found framework '{}'".format(detected_framework))

    target_template_dir = template_directory.format(detected_framework)
    logger.info("Using template directory '{}'".format(target_template_dir))

    logger.info("Generating template for '{}' script".format(detected_framework))

    if force is True:
        logger.warn("Force flag is set, continuing with generating template".format(detected_framework))

    if force is False and \
       path.exists("{}\\{}".format(dest_directory, "fxmanifest.lua")) and \
       path.exists("{}\\{}".format(dest_directory, "config.lua")):
        logger.info("Script already exists in '{}', skipping template generating ...".format(dest_directory))

    else:
        if force is False:
            logger.info("Template does not exist, continuing with generating template".format(detected_framework))

        os.makedirs(dest_directory, exist_ok=True)
        template_data["framework"] = detected_framework

        for target in list(pathlib.Path(target_template_dir).rglob("*")):
            full_path = "{}".format(target).replace(target_template_dir, dest_directory)

            if target.is_file():
                with open(target, "r") as f_in:
                    data = f_in.read()
                data = chevron.render(data, template_data)
                with open(full_path.replace(".mustache", ""), "w+") as f_in:
                    f_in.write(data)
            else:
                os.makedirs(full_path, exist_ok=True)

        logger.info("Template generated for '{}' script".format(detected_framework))


# Test the script
if __name__ == "__main__":
    template_generator(dest_directory='.template',
                       source_directory='.template/.source',
                       template_directory='..\\templates\\{}',
                       force=True)

