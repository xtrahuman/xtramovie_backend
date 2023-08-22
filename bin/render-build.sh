#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
# below was commented due its api only
# bundle exec rake assets:precompile
# bundle exec rake assets:clean
bundle exec rake db:migrate
# rails db:migrate