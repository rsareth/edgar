/etc/init.d/redis-server start
cd /var/rails/edgar
RAILS_ENV=production bundle exec sidekiq -d -C config/sidekiq.yml
