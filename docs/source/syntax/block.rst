Block
=====

Usage
------
Use ``Block`` to define major areas of a :doc:`page`.
Each page can contain one or more blocks.

..  code-block:: imagineui

    Page "Signup"
    Block "Personal data"
        Field "Name"
        Field "Surname"
        Field "e-mail"
        Button "Sign up"

Note that you can define :ref:`layouts <layout>` for elements in a block.
