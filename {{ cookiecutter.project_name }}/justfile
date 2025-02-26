#!/usr/bin/env just --justfile

set dotenv-load := true

default:
  just --list

lint:
  pre-commit run ruff -a

setup: && sync-dependencies
  uv venv --prompt {{project}}
  uv sync


sync-dependencies:
  uv sync

upgrade-dep dependency:
  uv upgrade {{dependency}}

kind := 'report'

coverage kind=kind:
  coverage run -m pytest tests
  coverage kind
