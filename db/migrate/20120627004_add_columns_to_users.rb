class AddColumnsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :messages_count, :integer, :default => 0
    add_column :users, :location,    :string
    add_column :users, :signature,   :text
  end

  def self.down
    remove_column :users,   :messages_count
    remove_column :users,   :location
    remove_column :users,   :signature
  end
end
