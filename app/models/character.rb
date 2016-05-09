class Character < ActiveRecord::Base
  validates :alias, presence: true
end
