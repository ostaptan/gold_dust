class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :ticket_id, :null => false
      t.text :message
      t.integer :author_id

      t.timestamps
    end
  end
end
