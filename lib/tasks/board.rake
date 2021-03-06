namespace :redmine do
  namespace :boards do
    desc "fix boards and messages"
    task :migrate => :environment do
 
      
      puts "update `C++ Framework` board"
      Board.find(6).update_attributes(:board_list_id => 1, :position => 1)
      
      puts "update `Javascript Binding` board"
      Board.find(20).update_attributes(:board_list_id => 1, :position => 2)
      
      puts "update `Lua binding` board"
      Board.find(11).update_attributes(:board_list_id => 1, :position => 3)
      
      puts "update `Extensions and Tools` board"
      Board.find(18).update_attributes(:board_list_id => 1, :position => 4)
      
      
      
      puts "migrate topics begin"
      puts "topics #{Message.count}"
      
      
      puts "migrate `cocos2d-x` topics"
      Message.find(:all, :conditions => ["board_id = ?", 6]).each do |m|
        m.update_attributes(:board_category_id => 1)
      end
      
      
      puts "migrate `platform-blackberry-qnx` topics"
      Message.find(:all, :conditions => ["board_id = ?", 16]).each do |m|
        m.update_attributes(:board_id => 6, :board_category_id => 8)
      end
      Board.find(16).destroy if Board.find(16).messages.blank?
      
      
      puts "migrate `platform-bada` topics"
      Message.find(:all, :conditions => ["board_id = ?", 15]).each do |m|
        m.update_attributes(:board_id => 6, :board_category_id => 7)
      end
      Board.find(15).destroy if Board.find(15).messages.blank?
      
      
      puts "migrate `platform-linux` topics"
      Message.find(:all, :conditions => ["board_id = ?", 14]).each do |m|
        m.update_attributes(:board_id => 6, :board_category_id => 6)
      end
      Board.find(14).destroy if Board.find(14).messages.blank?
      
      
      puts "migrate `platform-marmalade` topics"
      Message.find(:all, :conditions => ["board_id = ?", 13]).each do |m|
        m.update_attributes(:board_id => 6, :board_category_id => 5)
      end
      Board.find(13).destroy if Board.find(13).messages.blank?
      
      
      puts "migrate `platform-win32` topics"
      Message.find(:all, :conditions => ["board_id = ?", 12]).each do |m|
        m.update_attributes(:board_id => 6, :board_category_id => 4)
      end
      Board.find(12).destroy if Board.find(12).messages.blank?
      
      
      puts "migrate `platform-android` topics"
      Message.find(:all, :conditions => ["board_id = ?", 10]).each do |m|
        m.update_attributes(:board_id => 6, :board_category_id => 3)
      end
      Board.find(10).destroy if Board.find(10).messages.blank?
      
      
      puts "migrate `platform-ios` topics"
      Message.find(:all, :conditions => ["board_id = ?", 7]).each do |m|
        m.update_attributes(:board_id => 6, :board_category_id => 2)
      end
      Board.find(7).destroy if Board.find(7).messages.blank?
      
      

      
      
      
      puts "update `html5 Framework` board"
      Board.find(19).update_attributes(:board_list_id => 2, :position => 5)


      
      puts "update `C# Framework` board"
      Board.find(17).update_attributes(:board_list_id => 3, :position => 6)
      
      puts "migrate `C# Framework` topics"
      Board.find(17).messages.each do |m|
        m.update_attributes(:board_category_id => 12)
      end


      
      puts "update `Game/Demo showcase` board"
      Board.find(21).update_attributes(:board_list_id => 4, :position => 7)
      
      puts "update `Collaboration and hiring` board"
      Board.find(22).update_attributes(:board_list_id => 4, :position => 8)
      
      puts "update `OFF-topic` board"
      Board.find(23).update_attributes(:board_list_id => 4, :position => 9)
      
      
      
      puts "migrate done"
      puts "topics #{Message.count}"
      
    end
  end
end