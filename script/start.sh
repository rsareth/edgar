#!/bin/bash

set -e

## MAIN
/etc/init.d/redis-server start
cd /var/rails/edgar
export RAILS_ENV=production
bundle exec sidekiq -d -C config/sidekiq.yml
bundle exec rake db:migrate
bundle exec rails s
