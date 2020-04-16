class Activity < ApplicationRecord
  LEVEL = ['débutant', 'découverte', 'intermédiaire', 'bon', 'expert', 'compétitif']
  belongs_to :user
  belongs_to :category
  has_many :books
  validates :name, :category, :date,:address, :price, :level, presence: true
  validates :name, :date,:address, length: { minimum: 1 }
  geocoded_by :address
  after_validation :geocode

  include PgSearch::Model
  pg_search_scope :search_by_name_and_lieu_and_category,
    against: [ :name, :lieu ],
    associated_against: {
      category: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
  }
  include PgSearch::Model
  pg_search_scope :search_by_level,
    against: [ :level ],
    using: {
      tsearch: { prefix: true }
  }

  def self.level_in_integer(string)
    case string
      when 'débutant'
        return 0
      when 'découverte'
        return 1
      when 'intermédiaire'
        return 2
      when 'bon'
        return 3
      when 'expert'
        return 4
      when 'compétitif'
        return 5
    end
  end

  def self.level_in_string(integer)
    case integer
      when 0
        return 'débutant'
      when 1
        return 'découverte'
      when 2
        return 'intermédiaire'
      when 3
        return 'bon'
      when 4
        return 'expert'
      when 5
        return 'compétitif'
    end
  end
end
