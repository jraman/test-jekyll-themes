#!/bin/bash -ex

rbenv version 2.7.0
bundle exec jekyll -v
# Filter out annoying error message:
# jekyll-3.8.5/lib/jekyll/tags/include.rb:194: warning: Using the last argument as keyword parameters is deprecated
bundle exec jekyll serve 2>&1 | grep -v 'warning: Using the last argument as keyword parameters is deprecated'
