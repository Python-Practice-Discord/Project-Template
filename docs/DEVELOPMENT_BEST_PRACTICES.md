# Best Practices

## Git

This project follows a couple of simple principles:

* All code on the `main` branch is in production.
* All code on the `staging` branch is on staging.
* All code going to `main` or `staging` must go through a pull request.
* All pull requests must pass GitHub Action checks and have multiple reviewers.

### Branches

#### Main

Code on the main branch is in production. All code merged into main must go through a PR

#### Staging

Code on the staging branch is in the staging environment. All code merged into main must go through
a PR

#### Feature

Feature branches are the catch-all branches. If you are not fixing a bug or doing a hotfix then it
should be on a feature branch.

Feature branches naming convention are as
follows: `feature/<github ticket_number>_<short_description>` IE: `feature/#15_example_ticket`

#### Bugfix

Bugfix branches are used when working a ticket labeled as a bug. Bugfixes differ from hotfixes in
hotfixes are an issue that is causing production to fail. Bugfixes can take longer and are not a
drop everything to resolve issue.

Bugfix branches naming convention are as
follows: `bugfix/<github ticket_number>_<short_description>` IE: `bugfix/#2_example_bugfix_ticket`

#### Hotfix

Hotfix branches are ONLY used when there is a production issue that has to be resolved ASAP. Hotfix
branches are the only branches that can be merged directly into `main`. All other branches must be
merged into staging and deployed to the staging environment prior to being merged to `main`

NOTE: When merging a hotfix directly to `main` `main` MUST be merged back into `staging` ASAP.

Feature branches naming convention are as
follows: `hotfix/<github ticket_number>_<short_description>` IE: `hotfix/#1_stop_everything_and_fix`

### Merging

All merging must be done via a pull request. All pull requests must pass the GitHub actions.

All branches except `hotfix` must be merged into the staging branch prior to being merged to master.

## Editors

This project provides a .editorconfig file that tells your editor how to treat some files. This
includes 4 spaces per tab in python files, no whitespace at the end of lines, and using lf as the
new line character.

## Linters and formatters.

This project uses the isort, black formatter, and Flake8 to ensure everyone's code follows the same
standards and best practices. The code standards are enforced on commit time via pre-commit and
during pull requests via GitHub actions.

These tools can be run outside of commit by running `make check` in your terminal. Running this can
change your files.

Black will automatically reformat your files, and isort will reorder your imports. This should never
break your code, just change how it looks.

Flake8 will check some python best practices and throw error messages if you have any.

## Static analysis

Mypy runs a some static analysis on python types to help avoid some common errors. Mypy can be run
using `make check` or on its own `mypy tests/ src/`.
