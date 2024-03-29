# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

require File.expand_path(File.dirname(__FILE__) + "/environment")
rails_env = Rails.env.to_sym
set :environment, rails_env
set :output, "log/cron.log" # ログをアウトプットする
every 1.day, at:['9:00 am', '0:00 pm', '3:00 pm', '8:00 pm'] do
  begin
    runner "Batch::RemindTask.remind_task" # この処理を実行する
  rescue => e
    Rails.logger.error("aborted rails runner")
    raise e
  end
end
