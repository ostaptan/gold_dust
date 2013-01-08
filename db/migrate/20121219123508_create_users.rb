class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users, :force => true do |t|
      t.string :name,               :null => false   # optional, see below
      t.string :password_digest,    :null => false   # optional, see below
      t.string :phone,              :limit => 20
      t.string :gender,             :limit => 1
      t.boolean :active,            :default => false
      t.integer :is_admin,          :default => false
      t.string :surname
      t.string :mail,               :null => false
      t.string :avatar
      t.string :settings
      t.text :tags
      t.integer  :login_count,      :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
      t.datetime :last_request_at  # optional, see Authlogic::Session::MagicColumns
      t.datetime :current_login_at # optional, see Authlogic::Session::MagicColumns
      t.datetime :last_login_at    # optional, see Authlogic::Session::MagicColumns
      t.string   :current_login_ip # optional, see Authlogic::Session::MagicColumns
      t.string   :last_login_ip    # optional, see Authlogic::Session::MagicColumns

      t.timestamps
    end
  end

  def down
  end
end
