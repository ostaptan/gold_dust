class Ticket < ActiveRecord::Base

  validates_presence_of :title
  validates_presence_of :body

  has_many :comments, :class_name => 'Comment', :foreign_key => 'ticket_id'
  belongs_to :user

  def create_new(attr, reporter)
    self.transaction do
      self.title = attr[:title]
      self.body = attr[:body]
      self.priority = attr[:priority]
      self.reporter = reporter
      self.assigned_to = find_user attr[:assigned_to]
      self.save!
    end
  end

  def find_user(name)
    user = User.find_by_name name
    user.id if user
  end

  def accept_ticket!
    if self.status == 0
      self.status += 1
      self.save!
    end
    true
  end

  def resolve_ticket!
    if self.status == 1
      self.status += 1
      self.save!
    end
    true
  end

  def close_ticket!
    if self.status == 2
      self.status += 1
      self.save!
    end
    true
  end

  def reporter_user
    u = User.find_by_name self.reporter
    u ? u.name : self.reporter
  end

  def assigned_to_user
    User.find_by_id self.assigned_to
  end

  def status_name
    case self.status
      when 0
        'Reassigned'
      when 1
        'Accepted'
      when 2
        'Resolved'
      when 3
        'Closed'
      else
        'None'
    end
  end

  def self.priorities
    [:low, :medium, :high, :highest]
  end

  def self.find_by_type(priority, type, user_id)
    type ? status = type.split('_') : returned = self.where(:priority => priority)
    if status && status.size == 2
      sql = "SELECT * FROM tickets WHERE priority = '#{priority}' and assigned_to = #{user_id} and status = '#{status.last}'"
      return self.find_by_sql sql
    elsif status
      sql = "SELECT * FROM tickets WHERE priority = '#{priority}' and status = '#{status.first}'"
      return self.find_by_sql sql
    end
    returned
  end

end
