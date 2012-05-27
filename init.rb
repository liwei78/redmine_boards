# liwei created at 2012-5-26
# 0.0.1 basic
require 'redmine'

Redmine::Plugin.register :redmine_boards do
  name 'Redmine Board plugin'
  author 'Riquel Li'
  description 'sort Board with BoardList'
  version '0.0.1'
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
