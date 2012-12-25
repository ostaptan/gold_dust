require 'newrelic_rpm'

class Schedule::Base

  class << self
    include NewRelic::Agent::Instrumentation::ControllerInstrumentation

    def root_task
      begin
        Dir.chdir RAILS_ROOT
        yield
      rescue Exception => e
        ExceptionNotifier.deliver_background_exception_notification(e)
      end
    end
    add_transaction_tracer :root_task, :category => :task

  end

end