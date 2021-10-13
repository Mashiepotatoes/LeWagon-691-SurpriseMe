require 'json'
require 'open-uri'
require 'faker'

Product.destroy_all
Category.destroy_all
Order.destroy_all
Rating.destroy_all
Occasion.destroy_all
GiftSession.destroy_all
Answer.destroy_all

# ---- categories ---- #

puts "Seeding categories!"

all_beauty = Category.create(name: "Beauty & Cosmetics")
video_games = Category.create(name: "Video Games")
cd_vinyl = Category.create(name: "CD & Vinyl Records")
pet_essentials = Category.create(name: "Pet Essentials")
toys_games = Category.create(name: "Toys & Games")
fashion = Category.create(name: "Fashion")
home_kitchen = Category.create(name: "Home & Lifestyle")
sports_outdoors = Category.create(name: "Outdoor Activities")

puts "Categories seeded!"

# ---- Amazon all_beauty Seeds ---- #
# file_path_beauty = File.join(__dir__, "amazon_datasets/all_beauty.json")
# serialised_all_beauty = File.read(file_path_beauty)
# parsed_all_beauty = JSON.parse(serialised_all_beauty)

# ---- Amazon video_games seeds ---- #
# file_path_vg = File.join(__dir__, "amazon_datasets/video_games.json")
# serialised_video_games = File.read(file_path_vg)
# parsed_video_games = JSON.parse(serialised_video_games)

# # ---- Amazon cd_vinyl seeds ---- #
# file_path_cdv = File.join(__dir__, "amazon_datasets/cd_vinyl.json")
# serialised_cd_vinyl = File.read(file_path_cdv)
# parsed_cd_vinyl = JSON.parse(serialised_cd_vinyl)

# parsed_pet_supplies = JSON.parse(serialised_pet_supplies)
# # ---- Amazon toys_games seeds ---- #

# file_path_tg = File.join(__dir__, "amazon_datasets/toys_games.json")
# serialised_toys_games = File.read(file_path_tg)
# parsed_toys_games = JSON.parse(serialised_toys_games)

# ---- Amazon electronics seeds ---- #

# file_path_tg = File.join(__dir__, "amazon_datasets/electronics.json")
# serialised_electronics = File.read(file_path_tg)
# parsed_electronics = JSON.parse(serialised_electronics)

# ---- Amazon fashion seeds ---- #

# file_path_tg = File.join(__dir__, "amazon_datasets/fashion.json")
# serialised_fashion = File.read(file_path_tg)
# parsed_fashion = JSON.parse(serialised_fashion)

# # ---- Amazon home_kitchen seeds ---- #

# file_path_tg = File.join(__dir__, "amazon_datasets/home_kitchen.json")
# serialised_home_kitchen = File.read(file_path_tg)
# parsed_home_kitchen = JSON.parse(serialised_home_kitchen)

# # ---- Amazon sports_outdoors seeds ---- #

# file_path_tg = File.join(__dir__, "amazon_datasets/sports_outdoors.json")
# serialised_sports_outdoors = File.read(file_path_tg)
# parsed_sports_outdoors = JSON.parse(serialised_sports_outdoors)

# ---- seeding ---- #
# parsed_datasets = [parsed_all_beauty, parsed_video_games, parsed_pet_supplies, parsed_cd_vinyl, parsed_toys_games, parsed_fashion, parsed_home_kitchen, parsed_sports_outdoors]
# parsed_datasets = [parsed_all_beauty, parsed_fashion]
# categories = [all_beauty, video_games, cd_vinyl, pet_essentials, toys_games, fashion, home_kitchen, sports_outdoors]

# ---- Demo set ---- #

file_path_tg = File.join(__dir__, "amazon_datasets/demo_set_beauty.json")
serialised_demo_set_beauty = File.read(file_path_tg)
parsed_demo_set_beauty = JSON.parse(serialised_demo_set_beauty)

file_path_tg = File.join(__dir__, "amazon_datasets/demo_set_fashion.json")
serialised_demo_set_fashion = File.read(file_path_tg)
parsed_demo_set_fashion = JSON.parse(serialised_demo_set_fashion)

parsed_datasets = [parsed_demo_set_beauty, parsed_demo_set_fashion]
categories = [all_beauty, fashion]

puts "Creating products"
categories_index = 0
parsed_datasets.each do |dataset|
  dataset.each do |product_raw|
    name = product_raw["title"]
    description = product_raw["description"]
    image_url = product_raw["imageURLHighRes"]
    brand = product_raw["brand"]
    price = product_raw["price"].to_i
    subcategory = product_raw["sub_category"]

    product_inst = Product.new(name: name, description: description, price: price, image_url: image_url, brand: brand, subcategory: subcategory)
    product_inst.category = categories[categories_index]
    product_inst.save!
  end
  categories_index += 1
end

# ---- Create occasion cover image ---- #
puts "Creating Occasion cover images"
general = Occasion.create(name: "General", cover_image: "General")
birthday = Occasion.create(name: "Birthday", cover_image: "Birthday")
christmas = Occasion.create(name: "Christmas", cover_image: "Christmas")
anniversary = Occasion.create(name: "Anniversary", cover_image: "Anniversary")
housewarming = Occasion.create(name: "Housewarming", cover_image: "Housewarming")
puts "Cover images created"

# ---- Linking Products to Occasions ---- #
puts "Linking products to occasions"
Product.all.each do |product|
  # (1..5).to_a.sample.times do
    product.occasions << Occasion.second
  # end
end
puts "Linking done"
# ---- Create Users ---- #

User.create(
  address: Faker::Address.full_address,
  birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
  username: "Yen",
  email: "yen@gmail.com",
  password: "123456",
  first_name: "Ashton",
  last_name: "Shane"
)
User.create(
  address: Faker::Address.full_address,
  birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
  username: "Mashie",
  email: "ash@gmail.com",
  password: "123456",
  first_name: "Yenyen",
  last_name: "Choo"
)
puts "creating users"
10.times do |i|
  User.create(
    address: Faker::Address.full_address,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end
puts "created #{User.count} users"

# ---- Create Orders, Sessions, and Ratings ---- #
puts "creating orders, sessions, and ratings"
1000.times do |i|
  # cart = Cart.create
  product = Product.all.sample
  recipient = User.all.sample
  # order = Order.create(
  #   product: product, 
  #   user: User.all.sample, 
  #   cart_id: (1..10).to_a.sample,
  #  )
  session = GiftSession.create(
    user: User.all.sample,
    recipient: recipient,
    budget: (10..100).to_a.sample,
    occasion_id: (1..5).to_a.sample
    )
  rating = Rating.create!(
    rating: (1..5).to_a.sample,
    user: session.recipient,
    product: product
    )
end

puts "Created #{Product.count} products"
puts "finished creating #{Order.count} orders"
puts "finished creating #{GiftSession.count} gift sessions"
puts "finished creating #{Rating.count} ratings"

# ---- Create Questions ---- #
file_path_questions = File.join(__dir__, "questions_dataset/demo_set.json")
serialised_questions = File.read(file_path_questions)
parsed_questions = JSON.parse(serialised_questions)

parsed_questions.each do |question|
  content = question["question"]
  options = question["options"]
  subcategory = question["subcat"]

  Question.create(content: content, options: options, subcategory: subcategory)
end
