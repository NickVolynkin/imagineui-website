# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = docs/source
BUILDDIR      = build
PUBLISHDIR    = publish
BUILDER       = dirhtml

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile docs publish

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)


en:
	@$(SPHINXBUILD) -M $(BUILDER) "$(SOURCEDIR)" "$(BUILDDIR)"/en -D language=en

ru:
	@$(SPHINXBUILD) -M $(BUILDER) "$(SOURCEDIR)" "$(BUILDDIR)"/ru -D language=ru_RU


serve: clean
	sphinx-autobuild -E -b $(BUILDER) --delay 5 --ignore *_jb_* -D language=en "$(SOURCEDIR)"  "$(BUILDDIR)/en"

serve-ru: clean
	sphinx-autobuild -E -b $(BUILDER) --delay 5 --ignore *_jb_* -D language=ru_RU "$(SOURCEDIR)" "$(BUILDDIR)/ru"

docs: clean en ru

clean-publish:
	rm -rf "$(PUBLISHDIR)"

prepare-publish: docs clean-publish
	cp -r site "$(PUBLISHDIR)"
	mkdir -p "$(PUBLISHDIR)/en" "$(PUBLISHDIR)/ru"
	cp -r "$(BUILDDIR)/en/$(BUILDER)" 	"$(PUBLISHDIR)/en/docs"
	cp -r "$(BUILDDIR)/ru/$(BUILDER)" 	"$(PUBLISHDIR)/ru/docs"

publish-only:
	gh-pages -tf -r git@github.com:imagineui/imagineui.github.io.git -d publish

publish: prepare-publish publish-only

toc:
	doctoc --maxlevel 1 readme.md
