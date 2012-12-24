class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title, :null => false, :limit => 100
      t.string :priority, :default => 'medium'
      t.integer :reporter, :null => false
      t.integer :assigned_to
      t.text :body
      t.text :history
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
