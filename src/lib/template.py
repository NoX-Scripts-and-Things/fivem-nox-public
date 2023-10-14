import os
import pathlib
import chevron

from os import path
from src.lib.logger import info_log
from src.lib.framework import cache_framework

template_data = {
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
        'custom_mods_directory_name': '',
    }
}


def template_generator(dest_directory: str = '.',
                       source_directory: str = '.source',
                       template_directory: str = '..\\templates\\{}',
                       force: bool = False):
    current_framework = cache_framework(source_dir=source_directory)
    target_template_dir = template_directory.format(current_framework)

    info_log("Generating template for '{}' script".format(current_framework))

    if force is False and \
       path.exists("{}\\{}".format(dest_directory, "fxmanifest.lua")) and \
       path.exists("{}\\{}".format(dest_directory, "config.lua")):
        info_log("Script already exists in '{}', skipping template generating ...".format(dest_directory))

    else:
        info_log("Template does not exist, continuing with generating template".format(current_framework))

        os.makedirs(dest_directory, exist_ok=True)
        template_data["framework"] = current_framework

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

        info_log("Template generated for '{}' script".format(current_framework))


if __name__ == "__main__":
    template_generator('.template', '.template/.source', True)

