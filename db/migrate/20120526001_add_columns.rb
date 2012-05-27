class AddColumns < ActiveRecord::Migration
  def self.up
    add_column :boards,   :board_list_id,     :integer
    add_column :messages, :board_category_id, :integer
  end

  def self.down
    remove_column :boards,   :board_list
    remove_column :messages, :board_category
  end
end
