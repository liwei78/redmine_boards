class CreateBoardList < ActiveRecord::Migration
  def self.up
    create_table :board_lists do |t|
      t.column  :name, :string
      t.column  :position, :integer, :default => 0
    end
    BoardList.create([
        {:name => "cocos2d-x"},
        {:name => "cocos2d-html5", :position => 1},
        {:name => "cocos2d-xna",   :position => 2},
        {:name => "General",       :position => 3}
      ])
  end

  def self.down
    drop_table :board_lists
  end
end
