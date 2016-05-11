class Character < ActiveRecord::Base
  belongs_to :universe
  
  validates :alias, presence: true, uniqueness: {case_sensitive: false}
end
