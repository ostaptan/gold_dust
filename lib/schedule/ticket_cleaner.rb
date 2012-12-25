class Schedule::TicketCleaner < Schedule::Base

  def self.clear
    sql = "DELETE * FROM tickets WHERE created_at < #{Time.now - 30.days}"
    ActiveRecord::Base.connection.execute(sql)
  end

end