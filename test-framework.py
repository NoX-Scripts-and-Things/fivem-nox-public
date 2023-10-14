import sys

from src.lib.framework import cache_framework
from src.lib.importer import import_source
from src.lib.template import template_generator

import_source("fivem-nox-public", ".source")
import_source("fivem-nox-testing-suite", ".source")
