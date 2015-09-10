require 'socket'

HOSTNAME = case ENV['RAILS_ENV']
  when 'development'
    'localhost:3000'
  when 'staging'
    'staging.getreview.ru'
  else
    'getreview.ru'
  end