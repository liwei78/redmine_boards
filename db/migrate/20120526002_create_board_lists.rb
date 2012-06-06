class CreateBoardLists < ActiveRecord::Migration
  def self.up
    create_table(:board_lists, :options => 'DEFAULT CHARSET=utf8') do |t|
      t.column  :name,     :string
      t.column  :position, :integer, :default => 0
    end
    BoardList.create([
        {:name => "cocos2d-x",     :position => 1},
        {:name => "cocos2d-html5", :position => 2},
        {:name => "cocos2d-xna",   :position => 3},
        {:name => "General",       :position => 4},
      ])
  end

  def self.down
    drop_table :board_lists
  end
end
