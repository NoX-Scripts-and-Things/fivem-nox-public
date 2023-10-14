import sys

from src.lib.framework import cache_framework
from src.lib.importer import import_source
from src.lib.template import template_generator

framework: str = sys.argv[1]

if framework != "qb-core" and framework != "esx":
    print("Unsupported framework provided: {}".format(framework))
    exit()

cache_framework(framework, source_dir="../")

import_source("fivem-nox-core", "..")
import_source("fivem-nox-server", "..")
import_source("fivem-nox-testing-suite", "..")
# import_source("fivem-nox-public", "..")

import_source("fivem-nox-public", "../fivem-nox-core/.source")
import_source("fivem-nox-testing-suite", "../fivem-nox-core/.source")

template_generator(dest_directory="..\\..",
                   source_directory="..\\..\\.source",
                   template_directory="src\\templates\\{}",
                   force=True)
