---
title      : "Python Packaging"
date       : 2019-09-16T11:14:40+02:00
publishdate: 2019-09-16T11:14:40+02:00
draft      : false
comments   : true
weight     : 5
revision   : 0
series:
- Python
categories:
- programming
tags:
- packaging
- setup.py
---

<!-- more -->

## Setup.py

> Fetches and saves the resources at a python env known location to be reused

{{% note %}}
Know the difference between a package, module and a distribution
{{% /note %}}

Packages on PyPI are not distributed as plain source code. Instead, they are wrapped into distribution packages. The most common formats for distribution packages are source archives and Python wheels.

* [entrypoint](https://stackoverflow.com/questions/774824/explain-python-entry-points)
  *  is typically a function (or other callable function-like object) that a developer or user of your Python package might want to use, though a non-callable object can be supplied as an entry point as well (as correctly pointed out in the comments!).
  *  command that someone else can run from command line
* Add External dependencies
  * `install_requires`
* package `__init__.py`
* module `.py`
  * `py_modules = ['moduleName']`
* distribution - file organizational stuff
* python setup.py `install` vs `develop`
  * develop creates **symlinks**
  * which speeds up, esp using **package_data**
* Ship data files (not source code) along with python source
  * `package_data`
* Add scripts, relative to setup.py file
* How to share code openly with others?
  * `is_dist` is a distribution
  * `is_bdist` binary distribution
* Use python setup.py to build RUST code !
  * cython - write in python syntax later translated to C
* Development Dependencies
  * `Pipfile`
  * `Pipfile.lock`
    * pytest, mock
* `sdist` - when people cannot download from git, pip you share a `tarball`
  * Widely used in companies like facebook and google
  * test tarball
    * `tar tzf dist/packagename.tar.gz`
  * PROBLEMS
    * Missing License file, missing test files, Pipfile, Pipfile.lock missing
    * Fix Missing files by writing `MANIFEST.in` file
    * `pip install check--manifest`
* Push to PyPy `twine`
  * twine check dist/*
* Add `tox` file to test if distribution works on other python versions or not


{{< code numbered="true" >}}
python setup.py [[[develop]]]
python setup.py --help
python setup.py [[[bdist_wheel]]]
pip install [[[-e .]]]
{{< /code >}}

* Faster symlinks than deep copy
* Build me a Wheel, binary distribution file
* Install packages locally, editable mode in current directory
  * End Result - file is now importable in virtualenv

## Why should you package and distribute code?

{{% warning %}}
Copy and Paste is NOT how you should share your code, stackoverflow is not the solution
{{% /warning %}}

* Evrytime you upload a pcakage, you are making someones life better

```sh
(venv) ~/R/r/dist ❯❯❯ tar tzf robotframework-rpa-web-core-1.0.tar.gz
robotframework-rpa-web-core-1.0/
robotframework-rpa-web-core-1.0/PKG-INFO
robotframework-rpa-web-core-1.0/README.md
robotframework-rpa-web-core-1.0/setup.cfg
robotframework-rpa-web-core-1.0/setup.py
robotframework-rpa-web-core-1.0/src/
robotframework-rpa-web-core-1.0/src/robotframework_rpa_web_core.egg-info/
robotframework-rpa-web-core-1.0/src/robotframework_rpa_web_core.egg-info/PKG-INFO
robotframework-rpa-web-core-1.0/src/robotframework_rpa_web_core.egg-info/SOURCES.txt
robotframework-rpa-web-core-1.0/src/robotframework_rpa_web_core.egg-info/dependency_links.txt
robotframework-rpa-web-core-1.0/src/robotframework_rpa_web_core.egg-info/requires.txt
robotframework-rpa-web-core-1.0/src/robotframework_rpa_web_core.egg-info/top_level.txt
robotframework-rpa-web-core-1.0/src/rpa-web-core/
robotframework-rpa-web-core-1.0/src/rpa-web-core/rf-resources/
robotframework-rpa-web-core-1.0/src/rpa-web-core/rf-resources/test.resource
(venv) ~/R/r/dist ❯❯❯
(venv) ~/R/rpa-web-core ❯❯❯ $ ttwine upload --repository-url https://test.pypi.org/legacy/ dist/*
Uploading distributions to https://test.pypi.org/legacy/
Enter your username: avimehenwal
Enter your password:
Uploading robotframework-rpa-web-core-1.0.tar.gz
100%|############################################################################################| 7.36k/7.36k [00:01<00:00, 4.49kB/s]
Uploading robotframework_rpa_web_core-1.0-py3.7.egg
100%|############################################################################################| 7.31k/7.31k [00:01<00:00, 7.37kB/s]

View at:
https://test.pypi.org/project/robotframework-rpa-web-core/1.0/
(venv) ~/R/rpa-web-core ❯❯❯
```

## Packaging Tools

* [gitignore file generator](https://www.gitignore.io/)
* [Choose a proper License for your project](https://choosealicense.com/)
* [Cookiecutter](https://github.com/cookiecutter/cookiecutter)
  * creates projects from project templates



### Footnotes

* [Making sense of setup.py](https://youtu.be/S-Le3PWHqZA)
* https://youtu.be/QgZ7qv4Cd0Y
* https://github.com/avimehenwal/rpa-web-core


[awesome]: https://github.com/angrykoala/awesome-browser-automation

