class Category < ApplicationRecord
  has_many :activities
  has_one_attached :photo

  def self.array_of_name
    category_name = []
    Category.all.each { |category|
      category_name << category.name
    }
    return category_name
  end
end
