class AddColumns < ActiveRecord::Migration
  def self.up
    add_column :boards,   :board_list,     :integer
    add_column :messages, :board_category, :integer
  end

  def self.down
    remove_column :boards,   :board_list
    remove_column :messages, :board_category
  end
end
