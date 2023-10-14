import sys

from lib.framework import cache_framework
from lib.importer import import_source
from lib.template import template_generator

framework: str = sys.argv[1]

if framework != "qb-core" and framework != "esx":
    print("Unsupported framework provided: {}".format(framework))
    exit()

cache_framework(framework, source_dir="../")

if framework == "qb-core":
    # Project Directory
    import_source("fivem-nox-core", "..")
    import_source("fivem-nox-server", "..")
    import_source("fivem-nox-testing-suite", "..")
    # import_source("fivem-nox-public", "..")

    # Source Code: fivem-nox-core
    import_source("fivem-nox-testing-suite", "../fivem-nox-core/.source")

    # Import public into the other source directories
    import_source("fivem-nox-public", "../fivem-nox-core/.source")
    import_source("fivem-nox-public", "../fivem-nox-server/.source")
    import_source("fivem-nox-public", "../fivem-nox-testing-suite/.source")

    template_generator(dest_directory="..\\..",
                       source_directory="..\\..\\.source",
                       template_directory="src\\templates\\{}",
                       force=True)