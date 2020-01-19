# -- Project information -----------------------------------------------------
from pygments.lexers.testing import GherkinLexer
from sphinx.application import Sphinx

project = 'ImagineUI'
copyright = '2020, Nick Volynkin'
author = 'Nick Volynkin'

# The full version, including alpha/beta/rc tags
release = '0.1.0'

# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    'sphinx_rtd_theme'
    ]

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = []

# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'sphinx_rtd_theme'

html_theme_options = {
    'canonical_url': '',
    'analytics_id': 'UA-107215405-2',  # Provided by Google in your dashboard
    'logo_only': False,
    'display_version': False,
    'style_external_links': False,
    # Toc options
    'collapse_navigation': False,
    'sticky_navigation': True,
    'includehidden': True,
    'titles_only': True
    }

html_context = {
    "display_github": True,
    'github_user': 'NickVolynkin',
    'github_repo': 'imagineui-website',
    'conf_py_path': 'docs/',
    }

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']
html_show_sourcelink = False
html_copy_source = False

locale_dirs = ['locale/']
gettext_compact = True  # default
gettext_uuid = True
gettext_location = False
gettext_additional_targets = ['literal-block', 'image']


imagineui = GherkinLexer()


def setup(app: Sphinx):
    app.add_lexer('imagineui', imagineui)
    pass
