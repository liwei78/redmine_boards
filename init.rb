# liwei created at 2012-5-26
# 0.0.1 basic
# 0.0.2 fix board topic show
# 0.0.3 sharethis
require 'redmine'

Redmine::Plugin.register :redmine_boards do
  name 'Redmine Board plugin'
  author 'Riquel Li'
  description 'Show the boards like a BBS forum, and each topic have a category.'
  version '0.0.3'
  url 'http://railser.cn'
  author_url 'http://railser.cn/me'

  settings :default => {},
           :partial => 'board_lists/manage'

end

ActionController::Routing::Routes.draw do |map|
  map.resources :board_lists
  map.resources :board_categories
  map.connect 'board_lists/:project_id', :controller => "board_lists", :action => "update", :conditions => {:method => :put}
end
