# poetry_python_template
poetry is expected to replace setuptools

This is a Poetry python project template that can be used to initiate Python project with all necessary tools for development, testing, deployment. It supports below features:

- using Poetry for dependency management
- code quality using isort, black, flake8, mypy
- test coverage using pytest and coverage
- add .vscode/lauch.json to debug python and run pytest from vscode using poetry virtual env
- add parametrize and function scope fixture into test cases

## preparation
* choose linux python environment

I only tested it on Centos 7.9.2009 with Python3.11, didn't try on windows or MacOS

I used below docker environment to run python project
[Centos7 docker with Python3.11](https://github.com/hahaliu2001/centos7_docker_python_install)

This dockerfile build Python3.11.2 with openssl and sqlite enable(without them, pip and pytest don't work) 

* install poetry

` python3 -m pip install poetry`

* add ssh key to github

[Adding a new SSH key to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)


## Usage

* getting start

    simply 'Use This Template' to create a new repository 

    git clone the repository

* run `make` show all commands
```
[root@6bfa66807bc3 poetry_python_template]# make
Usage: make <target>

Targets:
help:             ## Show the help.
show:             ## Show the current environment.
install:          ## Install the project in dev mode.
fmt:              ## Format code using black & isort.
lint:             ## Run pep8, black, mypy linters.
test: lint        ## Run tests and generate coverage report.
build: 			 ## Build wheel file and sdist using poetry
gitpush:          ## git stage, commit and push to remote
docs:         ## build and serve docs site
push_site:         ## push docs to github gh-pages
clean:            ## Clean unused files.
```
* run `make install` to install project

it creates virtual environment and install all dependencies

* now we can debug/run python code from vscode
  
  choose "Python: run poetry pytest" to run pytest
  
  choose "Python: poetry run Current File" to debug one file

* run `make fmt`
* run `make lint`
* run `make test`

htmlcov folder is created
*  `make docs`

run `mkdocs build` and `mkdocs serve` to create docs site on local 

* `make push_site`

push docs to github gh-page

* `make build`

Build wheel file and sdist file

* `make clean`
clean up all unused file and clean virtual environment

* `make gitpush`
git stage, commit and push to github

* some commands may not necessay during python development
for example, `make docs` and `make push_site` may not necessary if no document update

## how to use mkdocs
### edit the file
1. add markdown file into docs folder
2. change mkdocs.yml to add new file 
3. `mkdocs build ` to rebuild it
4. run it
    * `mkdocs serve` serving on 127.0.0.1:8000(default)
    * `mkdocs serve -a local_IP:port` serving on local_IP:port

### push docs to github gh-page
1. `mkdocs gh-deploy --clean` to push to github

2. visit https://{username}.github.io/{projectname} a few minutes later

    in this example, visit https://hahaliu2001.github.io/poetry_python_template/

## use poetry in windows 10 and mac through vscode
open vscode, seeting -> python create venv environment -> choose python version
ATTN:
a few python version installed in my macos, I first time select python3.12, and then pip install poetry report error ''stdlib.h' file not found'
then re-create venv, select default python3 which is python3.11.1 in my pc. poetry installation has no issue
### make sure terminal shows (.venv)
if not, open a new terminal
check python version: python --version
### intall poetry
` python -m pip install poetry`

makefile doesn't work in windows, need copy and run the command
### poery environment
poetry config virtualenvs.in-project true
poetry install

### run test
poetry run pytest -v --cov-config .coveragerc --cov=src -l -s --tb=short --maxfail=1 tests/


## add jupyter to poetry
` poetry add --group dev jupyter`
after the instllation, we can directly run ipynb file

## use poetry in windows 10 by vscode
open vscode, seeting -> python create venv environment -> choose python version
check python version: python --version
### intall poetry
python -m pip install poetry

makefile doesn't work in windows, need copy and run the command
### poery environment
poetry config virtualenvs.in-project true
poetry install

### run test
poetry run pytest -v --cov-config .coveragerc --cov=src -l -s --tb=short --maxfail=1 tests/
