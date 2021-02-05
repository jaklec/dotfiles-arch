#!/usr/bin/env bash

source ~/.venvs/mkdocs/bin/activate
mkdocs $@
deactivate
