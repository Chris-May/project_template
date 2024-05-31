#!/opt/homebrew/bin/just just --justfile

default:
  just --list

lint:
  ruff check . --watch --fix

setup: && sync-dependencies
  pip install pip-tools
  pre-commit install


sync-dependencies:
  pip-compile requirements.in
  pip-compile dev-requirements.in
  pip-sync requirements.txt dev-requirements.txt
  pip install -e .

upgrade-dep dependency:
 pip-compile requirements.in --upgrade-package {{dependency}}

kind := 'report'

coverage kind=kind:
  coverage run -m pytest tests
  coverage kind
