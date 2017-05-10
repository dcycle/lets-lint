Let's Lint
-----

An example of how to lint a variety of files using Docker containers. Linting is the process of validating the syntactic validity of files through static code analysis.

Concretly, if you have an obvious error in a CSS or PHP file, linting should catch it without running your program.

About this project
-----

This project includes a number of dummy code files in a variety of formats.

To lint these files, all you need to install on your computer or your continuous integration server is Docker. We'll see how.

Getting started
-----

Install the latest version of Docker, then download this project, and run `./lint.sh`.

If you want to lint your code changes using a continuous integration server such as [CircleCI](https://circleci.com), all you need is to install Docker on your CI server and run `./lint.sh` on it. See `./circle.yml` in this repo for an example.

This project itself is being checked by Circle CI and here are the results:

[![CircleCI](https://circleci.com/gh/dcycle/lets-lint.svg?style=svg)](https://circleci.com/gh/dcycle/lets-lint)
