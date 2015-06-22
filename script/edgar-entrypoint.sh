#!/bin/bash
set -e

source /etc/profile.d/rvm.sh
rake db:migrate
rails s
