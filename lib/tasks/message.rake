namespace :redmine do
  namespace :boards do
    desc "fix user's messages count"
    task :fix_messages_count => :environment do
      User.find(:all).each do |u|
        ucount = u.messages.count
        # u.update_attributes(:messages_count => ucount)
        # User.update_counters(u.id, :messages_count => ucount)
        ActiveRecord::Base.connection.execute("UPDATE `users` SET `users`.`messages_count` = #{ucount} WHERE `users`.`id` = #{u.id}")
        # u.save(false)
        u.reload
        puts "UID: #{u.id} messages_count: #{u.messages_count}"
      end
      puts "#{User.count} users"
    end
    
    desc "reset all user's messages count to 0"
    task :zero_messages_count => :environment do
      User.update_all :messages_count => 0
    end
  end
end
