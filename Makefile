PROJECT_NAME=poetry_python_template

.PHONY: help
help:             ## Show the help.
	@echo "Usage: make <target>"
	@echo ""
	@echo "Targets:"
	@fgrep "##" Makefile | fgrep -v fgrep

.PHONY: show
show:             ## Show the current environment.
	@echo "current environment:"
	@poetry env info

.PHONY: install
install:          ## Install the project in dev mode.
	@poetry install

.PHONY: fmt
fmt:              ## Format code using black & isort.
	@poetry run isort src/
	@poetry run isort tests/
	@poetry run  black -l 79 src/
	@poetry run black -l 79 tests/

.PHONY: lint
lint:             ## Run pep8, black, mypy linters.
	@poetry run flake8 src/
	@poetry run black -l 79 --check src/
	@poetry run black -l 79 --check tests/
	@poetry run mypy --ignore-missing-imports src/

.PHONY: test
test: lint        ## Run tests and generate coverage report.
	@poetry run pytest -v --cov-config .coveragerc --cov=src -l -s --tb=short --maxfail=1 tests/
	@poetry run coverage html

.PHONY: build
build: 			 ## Build wheel file and sdist using poetry
	@echo "🚀 Creating wheel and sdist file"
	@poetry build

.ONESHELL:
.PHONY: gitpush
gitpush:          ## git stage, commit and push to remote
	@poetry lock
	@git add .
	@read -p "input commit comment : " COMMIT_COMMENT
	@git commit -m "$$COMMIT_COMMENT"
	@git push

.PHONY: docs
docs:         ## build and serve docs site
	@poetry run mkdocs build
	@poetry run mkdocs serve

.PHONY: push_site
push_site:         ## push docs to github gh-pages
	@poetry run mkdocs gh-deploy --clean
	
.PHONY: clean
clean:            ## Clean unused files.
	@rm -rf .pytest_cache
	@rm -rf .mypy_cache
	@rm -rf build
	@rm -rf dist
	@rm -rf htmlcov
	@rm -rf coverage.xml
	@rm -rf docs/_build
	@rm -rf .coverage
	@rm -rf site
	# delete all virtual environments 
	@poetry env remove --all 

