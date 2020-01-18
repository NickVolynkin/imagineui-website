# Website and documentation for ImagineUI

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Contents**

- [Collaboration](#collaboration)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Collaboration

To start working on website and docs, first prepare your development environment:

1. Make sure you have Python 3.7 and `poetry` installed.

    ```console
    $ pip install poetry
    $ poetry --version
    
    Poetry version 1.0.2
    ```

2. Initialize a new virtual environment with `poetry`:

    ```console
    $ poetry install
    $ poetry shell
    $ sphinx-build --version
    
    sphinx-build 2.3.1
    ```

Now your environment is ready.

Every time you open a new terminal session (window), activate the virtual environment:

```console
$ poetry shell
$ which python

<shows path to your virtual environment>
```

# Developing docs

## Run a live-reload server

This will run a local webserver which rebuilds on changes and reloads your browser tab

```console
# English version
$ make serve

# translated Russian version
$ make serve-ru
```

# Publishing docs

# Paths

* `./site/` - website
* `./docs/` - Sphinx documentation
