class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title, :null => false, :limit => 100
      t.string :priority, :default => 'medium'
      t.string :reporter, :null => false
      t.integer :assigned_to
      t.text :body
      t.text :history
      t.integer :status, :default => 0
      t.string :reporter_mail, :null => false

      t.timestamps
    end
  end
end
