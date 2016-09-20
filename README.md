# conda-recipes

[![CircleCI](https://circleci.com/gh/ioos/conda-recipes/tree/master.svg?style=shield)](https://circleci.com/gh/ioos/conda-recipes/tree/master)
[![Travis-CI](http://img.shields.io/travis/ioos/conda-recipes/master.svg?style=flat)](https://travis-ci.org/ioos/conda-recipes)
[![AppVeyor](https://ci.appveyor.com/api/projects/status/behpiwxfraxcruv3?svg=true)](https://ci.appveyor.com/project/comtbot/conda-recipes)
[![Binder](http://mybinder.org/badge.svg)](http://mybinder.org/repo/ioos/conda-recipes)

The recipes here create conda packages useful to the IOOS community.
These packages are shared with the community at
[Anaconda.org](https://anaconda.org/ioos).
See the [wiki](https://github.com/ioos/conda-recipes/wiki) for more info.

**UPDATE**

This repository is no longer updated and all the recipes here are now in [conda-forge](https://conda-forge.github.io/).
We recommend add to conda-forge channel to your `.condarc` with:

```shell
conda config --add channels conda-forge --force
```

Conda-forge model is different from the IOOS repository:
in IOOS we host all the recipes in a single repository,
while in conda-forge each recipe is hosted in its own repository (or feedstock).
If proposing a new recipe users must send a PR to [staged-recipes](https://github.com/conda-forge/staged-recipes),
if changing an [existing recipe](https://conda-forge.github.io/feedstocks.html) just fork the feedstock and send the PR.

Note that all conda-forge recipes must have the maintainer GitHub Handle in a `extra/recipe-maintainers`.
The listed maintainers will be granted commit rights to the feedstock and are expected to help maintain the recipe via version updates, etc.

```yaml
extra:
    recipe-maintainers:
        - GitHubHandle
```
