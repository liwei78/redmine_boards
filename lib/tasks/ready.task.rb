namespace :redmine do
  namespace :boards do
    desc "fix boards and messages"
    task :fix do
      puts "create `C++ Framework` board, id is `19`"
      Board.create(:board_list_id => 1, :name => "C++ Framework", :discription => "hello")
      
      puts "create `Javascript Binding` board"
      Board.create(:board_list_id => 1, :name => "Javascript Binding", :discription => "hello")
      
      puts "move `Lua binding` board here"
      Board.find(11).update_attribute(:board_list_id, 1)
      
      puts "move `Extensions` board here"
      Board.find(18).update_attribute(:board_list_id, 1)
      
      puts "migrate messages begin"
      puts "migrate `cocos2d-x` messages"
      Board.find(6).messages.earh do |m|
        m.update_attributes(:board_id => 19, :board_category_id => 1)
      end
      
    end
  end
end