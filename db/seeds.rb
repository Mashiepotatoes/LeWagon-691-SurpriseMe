require 'json'
require 'open-uri'
require 'faker'

Product.destroy_all
Category.destroy_all

Category.create(name: "Electronics")
category = Category.find(1)
# ------ Jeremy and PE seeds ----- #

# Product.destroy_all
# Category.destroy_all
# Order.destroy_all
# Rating.destroy_all
# Question.destroy_all
# console.log("Products seeded!")

# console.log("Seeding categories!")
# Category.create(name: "Electronics")
# Category.create(name: "Beauty & Cosmetics")
# Category.create(name: "Pet Essentials")
# Category.create(name: "Home & Lifestyle")
# Category.create(name: "Outdoor Activities")
# Category.create(name: "Fashion")
# Category.create(name: "Jewellery")
# Category.create(name: "Video Games")
# Category.create(name: "Toys and Games")
# Category.create(name: "CDs and Vinyl")
# Category.create(name: "Travelling")
# console.log("Categories seeded!")

electronics = Category.create(name: "Electronics")
all_beauty = Category.create(name: "Beauty & Cosmetics")
video_games = Category.create(name: "Video Games")
cd_vinyl = Category.create(name: "CD & Vinyl Records")
pet_essentials = Category.create(name: "Pet Essentials")
toys_games = Category.create(name: "Toys & Games")
# home_lifestyle = Category.create(name: "Home & Lifestyle")

# ---- Amazon all_beauty Seeds ---- #
file_path_beauty = File.join(__dir__, "amazon_datasets/all_beauty.json")
serialised_all_beauty = File.read(file_path_beauty)
parsed_all_beauty = JSON.parse(serialised_all_beauty)

# ---- Amazon video_games seeds ---- #
file_path_vg = File.join(__dir__, "amazon_datasets/video_games.json")
serialised_video_games = File.read(file_path_vg)
parsed_video_games = JSON.parse(serialised_video_games)

# ---- Amazon cd_vinyl seeds ---- #
file_path_cdv = File.join(__dir__, "amazon_datasets/cd_vinyl.json")
serialised_cd_vinyl = File.read(file_path_cdv)
parsed_cd_vinyl = JSON.parse(serialised_cd_vinyl)

# ---- Amazon pet_supplies seeds ---- #
file_path_ps = File.join(__dir__, "amazon_datasets/pet_supplies.json")
serialised_pet_supplies = File.read(file_path_ps)
parsed_pet_supplies = JSON.parse(serialised_pet_supplies)

# ---- Amazon toys_games seeds ---- #

file_path_tg = File.join(__dir__, "amazon_datasets/toys_games.json")
serialised_toys_games = File.read(file_path_tg)
parsed_toys_games = JSON.parse(serialised_toys_games)

# ---- seeding ---- #
parsed_datasets = [parsed_all_beauty, parsed_video_games, parsed_pet_supplies, parsed_cd_vinyl, parsed_toys_games]
categories = [all_beauty, video_games, cd_vinyl, pet_essentials, toys_games]

puts "Creating products"
categories_index = 0
parsed_datasets.each do |dataset|
  dataset.each do |product|
    name = product["title"]
    description = product["description"].join
    image_url = product["imageUrlHighRes"]
    brand = product["brand"]
    price = product["price"]

    product = Product.new(name: name, description: description, price: price, image_url: image_url, brand: brand)
    product.category = categories[categories_index]
    product.save!
  end
  categories_index += 1
end
puts "Created #{Product.count} products"

# ---- Create Users ---- #

puts "creating users"
10.times do |i|
  User.create(
    # name: Faker::Name.name,
    address: Faker::Address.full_address,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
    # password: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 8)
  )
end
puts "created #{User.count} users"

# ---- Create Orders and Reviews ---- #
puts "creating orders and ratings"
# order_id = 1
# until order_id == 500
500.times do |i|
  order = Order.create(product_id: Product.all.sample.id)
  # rating = Rating).to_a.sample,
  #   order_id: order_id,
  #   user_id: User.all.sample.id
  #   )
  # rating.order = order
  # rating.save
end
puts "finished creating #{Order.count} orders"
# puts "finished creating #{Review.count} ratings"

# ---- Create Questions ---- #
file_path_questions = File.join(__dir__, "questions_dataset/questions.json")
serialised_questions = File.read(file_path_questions)
parsed_questions = JSON.parse(serialised_questions)

parsed_questions.each do |question|
  content = question["question"]
  options = question["options"]
  parent = question["parent"]
  dependency = question["dependency"] # dependency value is the number of its parent qn

  Question.create(content: content, options: options, parent: parent, dependency: dependency)
end
