class Character < ActiveRecord::Base
  belongs_to :universe

  has_many :character_abilities
  has_many :abilities, through: :character_abilities
  has_many :comments
  
  validates :alias, presence: true, uniqueness: {case_sensitive: false}
  validates :universe, presence: true

  has_attached_file :photo, :styles => { :medium => "300x300", :thumb => "100x100", :small => "50x50"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  def self.search(term)
    searchTerm = term
    Character.where("alias LIKE ? OR first_name LIKE ?", "%#{searchTerm}%", "%#{searchTerm}%")
  end
end
