class BoardList < ActiveRecord::Base
  has_many :boards, :order => "boards.position asc"
  has_many :board_categories, :order => "board_categories.position asc"
end
