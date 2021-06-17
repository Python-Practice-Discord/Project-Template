<p align="center">
    <a href="https://github.com/psf/black"><img alt="Code style: black" src="https://img.shields.io/badge/code%20style-black-000000.svg"></a>
</p>

# TODO

* finish docs
* clean up Makefile
* double check editor config
* Add git merging docs
    * git process

# Using this template

The projects' name should be `lower_snake_case`. This should be the same name as the projects' root
directory.

Find and replace the projects' name in these locations:

* Find all instances of `replaceme` and replace them with the projects' name.
* Change the name of `./src/project_template` to `./src/<project_name>`
* Change Github setting for the new repo
    * Protect the main and staging branches with both actions.
    * Require pull request reviews before merging
        * require review from code owner
    * Require conversation resolution before merging
    * Require branches to be up to date before merging

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

## Best Practices

### Git

This project follows a couple of simple principles:

* All code on the `main` branch is in production.
* All code on the `staging` branch is on staging.
* All code going to `main` or `staging` must go through a pull request.
* All pull requests must pass GitHub Action checks and have multiple reviewers.

#### Branches

##### Main

Code on the main branch is in production. All code merged into main must go through a PR

##### Staging

Code on the staging branch is in the staging environment. All code merged into main must go through
a PR

##### Feature

Feature branches are the catch-all branches. If you are not fixing a bug or doing a hotfix then it
should be on a feature branch.

Feature branches naming convention are as
follows: `feature/<github ticket_number>_<short_description>` IE: `feature/#15_example_ticket`

##### Bugfix

Bugfix branches are used when working a ticket labeled as a bug. Bugfixes differ from hotfixes in
hotfixes are an issue that is causing production to fail. Bugfixes can take longer and are not a
drop everything to resolve issue.

Bugfix branches naming convention are as
follows: `bugfix/<github ticket_number>_<short_description>` IE: `bugfix/#2_example_bugfix_ticket`

##### Hotfix

Hotfix branches are ONLY used when there is a production issue that has to be resolved ASAP. Hotfix
branches are the only branches that can be merged directly into `main`. All other branches must be
merged into staging and deployed to the staging environment prior to being merged to `main`

NOTE: When merging a hotfix directly to `main` `main` MUST be merged back into `staging` ASAP.

Feature branches naming convention are as
follows: `hotfix/<github ticket_number>_<short_description>` IE: `hotfix/#1_stop_everything_and_fix`

#### Merging

All merging must be done via a pull request. All pull requests must pass the GitHub actions.

All branches except `hotfix` must be merged into the staging branch prior to being merged to master.

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

