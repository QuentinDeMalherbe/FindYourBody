class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :category
  LEVEL = ['débutant', 'découverte', 'intermédiare', 'bon', 'expert', 'compétitif']

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
    when 'intermédiare'
      return 2
    when 'bon'
      return 3
    when 'expert'
      return 4
    when 'compétitif'
      return 5
  end
end

end
