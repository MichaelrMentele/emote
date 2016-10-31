web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
clock: bundle exec clockwork app/workers/clock.rb
worker: bundle exec sidekiq -c 1 -v