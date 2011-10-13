class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.references :user
      t.string :name, :null => false
      t.string :description
      t.string :status, :null => false, :default => User::STATUSES.first # which would be 'open'
      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end

