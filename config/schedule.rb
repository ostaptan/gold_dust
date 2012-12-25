set :output, " #{path}/log/cron_log.log"
set :environment, 'production'

every :monday, :at => "0:22am" do
  runner "Schedule::TicketCleaner.clear"
end