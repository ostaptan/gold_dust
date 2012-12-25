class Comment < ActiveRecord::Base

  validates_presence_of :author_id
  validates_size_of :message, :within => 3..500, :allow_nil => false

  belongs_to :ticket

  def create_new(attr, ticket_id, author_id)
    self.transaction do
      self.ticket_id = ticket_id
      self.message = attr[:message]
      self.author_id = author_id
      self.save!
    end
  end

  def author
    User.find_by_id(self.author_id).name
  end

end
