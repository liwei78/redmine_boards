class BoardCategory < ActiveRecord::Base
  acts_as_list
  belongs_to :board_list
  has_many :messages
end
