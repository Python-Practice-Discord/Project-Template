<p align="center">
    <a href="https://github.com/psf/black"><img alt="Code style: black" src="https://img.shields.io/badge/code%20style-black-000000.svg"></a>
</p>

# Project Name

**Brief Project Description Here**

#### Project Manager:

- Joe Schmoe

## How to Contribute:

First, if you're in the Discord, make sure that you've joined the GitHub organization.

If you'd like to join the core project team, which we're limiting to 10 people, you can reach out to
a project manager or moderator and request to join. This will be first-come first-serve, and we will
remove inactive contributors from the team periodically to make space for new contributors.

If you can't get into the core team for whatever reason, or if you don't want to join the core team,
you are still welcome to fork the project repository, and create a pull request to merge your
changes with the rest of the project.

## Getting started

You can work on this project using any OS, but macOS and Linux are supported with no changes. To
use Windows you will need to be using WSL/WSL2 as many commands are not supported by the regular
Windows CLI.

### Set up your dev env

All the project code is run in Docker and Docker-compose. This allows us to set up local databases,
fake APIs and generally reflect the production environment.

We also use venv for pre-commit hooks and code formatting, linting, and static analysis.

#### Venv

Run the following steps to get your python venv setup and enable pre-commit.

* `python3 -m venv ./venv`
* `source venv/bin/activate`
* `pip install -r ./requirements-pre-commit.txt`
* `pre-commit install`

#### Docker

Follow these steps to get docker setup on your machine.

* [Install docker on your machine](https://docs.docker.com/get-docker/)
    * HINT: If on linux `curl -fsSL https://get.docker.com -o get-docker.sh; sudo sh get-docker.sh`
* If on linux: [Install docker-compose on your machine](https://docs.docker.com/compose/install/)
* Run `make initialize_pg`
* Run `make interactive`

You now have a local postgres database with fake data, and the production schemas linked to your CLI.

## Code Best Practices

This project uses the black formatter and Flake8 for code
