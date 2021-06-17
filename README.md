<p align="center">
    <a href="https://github.com/psf/black"><img alt="Code style: black" src="https://img.shields.io/badge/code%20style-black-000000.svg"></a>
</p>

# TODO

* finish docs
* clean up Makefile
* double check editor config
* double check git ignore
* Add GitHub actions

# Using this template

The projects' name should be `lower_snake_case`. This should be the same name as the projects' root
directory.

Find and replace the projects' name in these locations:

* Find all instances of `<REPLACE>` and replace them with the projects' name.
* Change the name of `./src/project_template` to `./src/<project_name>`

# Project Name

**Brief Project Description Here**

## How to Contribute:

First, if you're in the Discord, make sure that you've joined the GitHub organization.

If you'd like to join the core project team, which we're limiting to 10 people, you can reach out to
a project manager or moderator and request to join. This will be first-come first-serve, and we will
remove inactive contributors from the team periodically to make space for new contributors.

If you can't get into the core team for whatever reason, or if you don't want to join the core team,
you are still welcome to fork the project repository, and create a pull request to merge your
changes with the rest of the project.

Please see the `Getting started` section of this readme for how to get this project up and running.

## Getting started

You can work on this project using any OS, but macOS and Linux are easier. To use Windows you will
need to be using WSL/WSL2 as many commands are not supported by the regular Windows CLI.

There is a Makefile in the root of this project. It contains most of the commands you will need.
These include

* `make interactive` which will drop you into a shell inside the projects' docker environment.
* `make check` which will run a set of formatting and static analysis tools.
* `make test` which will run all of our tests inside the projects' docker environment.

### Setting up your dev env

All the project code is run using Docker and Docker-compose. This allows us to set up local
databases, fake APIs and generally reflect the production environment.

This project uses Poetry to lock, install, and serve our python dependencies both locally and in
Docker.

#### Local Poetry

Run the following steps to get your local python env set up and enable pre-commit.

* `curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -`
* `poetry install`
* `poetry shell`
* `pre-commit install`

#### Docker

Follow these steps to get docker setup on your machine and get into shell inside the docker
environment.

* [Install docker on your machine](https://docs.docker.com/get-docker/)
    * HINT: If on linux `curl -fsSL https://get.docker.com -o get-docker.sh; sudo sh get-docker.sh`
* If on linux: [Install docker-compose on your machine](https://docs.docker.com/compose/install/)
* Run `make initialize_pg`
* Run `make interactive`

You now have a local postgres database with fake data, and the production schemas linked to your
CLI.

## Code Best Practices

### Editors

This project provides a .editorconfig file that tells your editor how to treat some files. This
includes 4 spaces per tab in python files, no whitespace at the end of lines, and using lf as the
new line character.

### Linters and formatters.

This project uses the isort, black formatter, and Flake8 to ensure everyone's code follows the same
standards and best practices. The code standards are enforced on commit time via pre-commit and
during pull requests via GitHub actions.

These tools can be run outside of commit by running `make check` in your terminal. Running this can
change your files.

Black will automatically reformat your files, and isort will reorder your imports. This should never
break your code, just change how it looks.

Flake8 will check some python best practices and throw error messages if you have any.

### Static analysis

Mypy runs a some static analysis on python types to help avoid some common errors. Mypy can be run
using `make check` or on its own `mypy tests/ src/`.

## Team

### Team lead

### Project Manager

- Joe Schmoe

