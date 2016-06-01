class Comment < ActiveRecord::Base
  belongs_to :character
  belongs_to :user

  validates :character, presence: true
  validates :user, presence: true
end
