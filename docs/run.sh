#!/bin/bash -ex

rbenv version 2.7.0
bundle exec jekyll -v
bundle exec jekyll serve
