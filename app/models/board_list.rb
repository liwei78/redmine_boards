class BoardList < ActiveRecord::Base
  validates_presence_of :name
  acts_as_list
  has_many :boards, :order => "boards.position asc"
  has_many :board_categories, :order => "board_categories.position asc"
end
