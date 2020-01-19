Thought process
===============

The purpose of this page is to document the decisions behind ImagineUI so that it's easier to transfer deep knowledge of the system later on.

Starting points
---------------

First of all, if we develop a tool for UX design, well, we have to provide parameters for the UI elements anyhow.

* Scene (.scene) – Describes elements and areas. `Documentation <https://imagineui.github.io/en/docs/>`_
    * Human-readable, as in "you can use .scene as a description for a task given to a UI designer";
    * Format should feel familiar for business/system analysts, as they are the most possible candidates for user-base;
    * DocOps; VCS, CI, Single-source, integration into existing toolsets should be as seamless as possible;
    * We should have as few features in the core language as possible, but polished to a point when writing text feel easier than using pen and paper. Less is more.
    * The tool should cover the UX of most modern apps/sites (ranging from messaging and e-commerce to complex geo-based systems) to be applicable in real-world scenarios.

We need a simple tool that does complex stuff.
I think, we can solve that by separating concerns via splitting the UX definitions and the UI details. Basically, HTML & CSS all over again, but going in the opposite direction (low-fidelity, no interactivity, etc.) in favor of ease of use.

* Guides (.guide) – Target-specific instructions for building layouts (i.e. to accommodate screen resolution, UI guidelines, etc.)

That way we can have the .guide files as complex as we want, but as new target platforms don't appear often, we can reuse .guide files for next projects, whilst keeping the .scene format lean.


Key Principles
--------------
* Keep it simple
    * `Unix way <https://en.wikipedia.org/wiki/Unix_philosophy>`_, hence 1 input file corresponds to 1 output. Advanced templating is to be done with higher-order tools (i.e. `Foliant <https://foliant-docs.github.io/docs/>`_)
    * Debatable, as some forms of templating are too common to be excluded from a tool (i.e. including a block from a file)
* Output should not try to look like too much like a mock-up, so as not to be confused with the final product before any UI/UX designer steps in.


Roadmap
-------

- [x] Scene Inflation/Layout Measurement tech.demo with Flexbox, hardcoded .guide scene descriptions
- [x] Document (Gherkin-like) .scene format, implement a parser
- [ ] [In Progress] Test coverage, CLI UX, usage docs with API and popular cases
- [ ] Define the .guide API, rules to choose widgets and an enhanced renderer
- [x] ~~Optimize rendering time (prebuilt TS, running daemon, incremental builds, etc.)~~ The core is rewritten with Preact, rendering in an editor is instant, takes 1-2 seconds to render with CLI

See also: `(In Russian) Some random thoughts documented on Trello <https://trello.com/b/vJbtfC6o/imagineui>`_

Tech notes
----------
Parsing a language yields a tree (AST).
UI elements are formed with trees (i.e. DOM).

Not having any layer of indirection/abstraction between those seems to fit well for low-fidelity description of UI elements, which is a huge plus for performance and ease of the tool's development.

See also: `Preact renderer for the .scene AST <https://github.com/imagineui/imagineui/blob/master/packages/imagineui-core/src/wireframe.tsx>`_


Similar work
------------
* `Gherkin/Cucumber <http://cucumber.io/>`_ – Successful natural-feeling language framework
* `PlantUML Salt <http://plantuml.com/salt>`_ – Good DocOps experience, poor UI renders
* Text adventures – Scene/Props/Actions routine somewhat make sense to describe UI

Contact
-------

Feel free to share your thoughts at vadkou@wave909.com.
DSL design relies on the feedback from the users, so your input will be greatly appreciated.
