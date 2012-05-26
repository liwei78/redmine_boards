class CreateBoardCategory < ActiveRecord::Migration
  def self.up
    create_table :board_categories do |t|
      t.column  :board_list, :integer
      t.column  :name,       :string
      t.column  :position,   :integer, :default => 0
    end
    BoardCategory.create([
      {:board_list => 1, :name => "",        :position => 0},
      {:board_list => 1, :name => "All",     :position => 1},
      {:board_list => 1, :name => "iOS",     :position => 2},
      {:board_list => 1, :name => "Android", :position => 3},
      
      {:board_list => 2, :name => "c++",        :position => 0},
      {:board_list => 2, :name => "javascript", :position => 1},
      {:board_list => 2, :name => "lua",        :position => 2},
    ])
  end

  def self.down
    drop_table :board_categories
  end
end
