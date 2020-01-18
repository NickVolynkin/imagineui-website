Button
======

Usage
------

Use the ``Button`` keyword for anything clickable on a page:

..  code-block:: imagineui

    Page "Signup"
    Block "Personal data"
        Field "Name"
        Field "Surname"
        Field "e-mail"
        Button "Sign up"

As with other keywords, word order and capitalization are optional:

..  code-block:: imagineui

    ...
    "Sign up" button
    "Log in" button

Examples
--------

Buttons in an installation wizard:

..  code-block:: imagineui

    Page "Installation Wizard"
    Block "Settings"
        "Some settings here"
    Block "Navigation"
        Button "Cancel"
        Button "Previous"
        Button "Next"

