import sys

from lib.framework import cache_framework
from lib.importer import import_git_source
from lib.template import template_generator

framework = sys.argv[1] if len(sys.argv) >= 2 else None
internal = sys.argv[2].lower() == "true" if len(sys.argv) >= 3 else False

if framework != "qb-core" and framework != "esx":
    print("Unsupported framework provided: {}".format(framework))
    exit()

cache_framework(framework, source_dir="../")

if framework == "qb-core":
    # Project Directory
    import_git_source("fivem-nox-core", "..")
    import_git_source("fivem-nox-server", "..")
    import_git_source("fivem-nox-testing-suite", "..")
    # import_git_source("fivem-nox-public", "..")

    # Source Code: fivem-nox-core
    import_git_source("fivem-nox-testing-suite", "../fivem-nox-core/.source")

    # Import public into the other source directories
    import_git_source("fivem-nox-public", "../fivem-nox-core/.source")
    import_git_source("fivem-nox-public", "../fivem-nox-server/.source")
    import_git_source("fivem-nox-public", "../fivem-nox-testing-suite/.source")

    template_generator(dest_directory="..\\..",
                       source_directory="..\\..\\.source",
                       template_directory="src\\templates\\{}")
