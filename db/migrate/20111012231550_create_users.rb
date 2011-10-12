class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username, :null => false, :limit => 10
      t.timestamps
    end
    add_index :users, :username, :unique => true, :name => :index_users_by_username
  end

  def self.down
    remove_index :users, :name => :index_users_by_username
    drop_table :users
  end
end

