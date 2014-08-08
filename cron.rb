# Use this file to easily define all of your cron jobs.
#
# to generate cronfile : `whenever -f cron.rb -w`
# for help on whenever : `whenever -h`
# to see cron settings : `crontab -l`
#
# Learn more:
# - http://github.com/javan/whenever  | cron processor
# - http://en.wikipedia.org/wiki/Cron | cron instructions

set :output, "/tmp/mvcondo_cron.log"

# every 2.days do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
#   rake "test"
# end

every 10.minutes do
  rake "test"
end

every 1.day do
  rake "cl:pull cl:generate build deploy"
end

