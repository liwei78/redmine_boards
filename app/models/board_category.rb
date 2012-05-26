class BoardCategory < ActiveRecord::Base
  belongs_to :board_list
  has_many :messages
end
