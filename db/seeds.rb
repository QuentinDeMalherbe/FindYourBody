# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Creating 20 fake category...'
20.times do
  category = Category.new(
    name:    Faker::Esport.game,
    photo:   Faker::LoremPixel.image(size: "50x60", is_gray: false, category: 'sports')
  )
  category.save!
end
puts'Category finished'
puts 'Creating 5 fake users...'
5.times do
  user = User.new(
    pseudo: Faker::Internet.username,
    first_name: Faker::Name.first_name ,
    last_name: Faker::Name.last_name ,
    phone: Faker::Number.leading_zero_number(digits: 10),
    email: Faker::Internet.email,
    encrypted_password: Faker::Internet.password(min_length: 8)
  )
  user.save!
end

puts'Users finished'

puts 'Creating 10 fake activities...'
10.times do
  offset1= rand(Category.count)
  offset2 = rand(User.count)
  activity = Activity.new(
    name: Faker::Name.first_name,
    date: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    level: rand(1..5),
    lieu: Faker::Address.full_address,
    comment: Faker::Lorem.paragraphs(number: 1),
    price: Faker::Number.decimal_part(digits: 2),
    user_id: User.find(offset2),
    category_id: Category.find(offset1)
  )
  activity.save!
end
puts'Activities finished'

puts 'Finished!'
