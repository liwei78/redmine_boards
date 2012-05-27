class CreateBoardCategories < ActiveRecord::Migration
  def self.up
    create_table :board_categories do |t|
      t.column  :board_list_id, :integer
      t.column  :name,          :string
      t.column  :position,      :integer, :default => 0
    end
    BoardCategory.create([
      {:board_list_id => 1, :name => "All",        :position => 1},
      {:board_list_id => 1, :name => "iOS",        :position => 2},
      {:board_list_id => 1, :name => "Android",    :position => 3},
      {:board_list_id => 1, :name => "win32",      :position => 4},
      {:board_list_id => 1, :name => "marmalade",  :position => 5},
      {:board_list_id => 1, :name => "Android",    :position => 6},
      {:board_list_id => 1, :name => "linux",      :position => 7},
      {:board_list_id => 1, :name => "bada",       :position => 8},
      {:board_list_id => 1, :name => "blackberry", :position => 9},
      
      {:board_list_id => 2, :name => "c++",        :position => 1},
      {:board_list_id => 2, :name => "javascript", :position => 2},
      {:board_list_id => 2, :name => "lua",        :position => 3},

      {:board_list_id => 3, :name => "xna",        :position => 1},
    ])
    
  end

  def self.down
    drop_table :board_categories
  end
end
