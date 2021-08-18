#!/bin/sh

#set -e

bundle check || bundle install
bundle exec sidekiq -C config/sidekiq.yml -L log/sidekiq.log