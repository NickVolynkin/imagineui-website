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
	@$(SPHINXBUILD) -M $(BUILDER) "$(SOURCEDIR)" "$(BUILDDIR)"/ru -D language=ru

es:
	@$(SPHINXBUILD) -M $(BUILDER) "$(SOURCEDIR)" "$(BUILDDIR)"/es -D language=es

serve: clean
	sphinx-autobuild -E -b $(BUILDER) --delay 5 --ignore *_jb_* -D language=en "$(SOURCEDIR)"  "$(BUILDDIR)/en"

serve-ru: clean
	sphinx-autobuild -E -b $(BUILDER) --delay 5 --ignore *_jb_* -D language=ru "$(SOURCEDIR)" "$(BUILDDIR)/ru"

docs: clean en ru es

clean-publish:
	rm -rf "$(PUBLISHDIR)"

prepare-publish: docs clean-publish
	cp -r site "$(PUBLISHDIR)"
	mkdir -p "$(PUBLISHDIR)/en" "$(PUBLISHDIR)/ru" "$(PUBLISHDIR)/es"
	cp -r "$(BUILDDIR)/en/$(BUILDER)" 	"$(PUBLISHDIR)/en/docs"
	cp -r "$(BUILDDIR)/es/$(BUILDER)" 	"$(PUBLISHDIR)/es/docs"
	cp -r "$(BUILDDIR)/ru/$(BUILDER)" 	"$(PUBLISHDIR)/ru/docs"

publish-only:
	npm run publish
	git fetch origin
	git push -f website origin/gh-pages:master

publish: prepare-publish publish-only

toc:
	doctoc --maxlevel 1 readme.md
