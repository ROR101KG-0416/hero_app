class Character < ActiveRecord::Base
  validates :alias, presence: true, uniqueness: {case_sensitive: false}
end
