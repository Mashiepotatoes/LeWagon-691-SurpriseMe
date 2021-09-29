require 'json'
require 'open-uri'
require 'faker'

Product.destroy_all
Category.destroy_all
Order.destroy_all
Rating.destroy_all

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

# ---- Create Users ---- #

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

# ---- categories ---- #

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

puts "Creating products and ratings"
categories_index = 0
parsed_datasets.each do |dataset|
  dataset.each do |product_raw|
    name = product_raw["title"]
    description = product_raw["description"].join
    image_url = product_raw["imageUrlHighRes"]
    brand = product_raw["brand"]
    price = product_raw["price"]
    # occasion = product_raw["occasions"]
    
    product_inst = Product.new(name: name, description: description, price: price, image_url: image_url, brand: brand)
    product_inst.category = categories[categories_index]
    product_inst.save!
    puts "Created #{product_raw["title"]}"

    # puts "finished creating #{product.rating.count} ratings"
  end
  categories_index += 1
end
puts "Created #{Product.count} products"

# ---- Create Orders, Sessions, and Ratings ---- #
puts "creating orders"
50.times do |i|
  product = Product.all.sample
  order = Order.create(product: product)
  session = GiftSession.create(
    order: order,
    user: User.first,
    recipient: User.last,
    budget: (10..100).to_a.sample
  )
  rating = Rating.create(
    rating: (1..5).to_a.sample,
    user: session.recipient,
    product: product
    )

end
puts "finished creating #{Order.count} orders"
puts "finished creating #{GiftSession.count} ratings"
puts "finished creating #{Rating.count} ratings"


# ---- Create Questions ---- #
file_path_questions = File.join(__dir__, "questions_dataset/questions.json")
serialised_questions = File.read(file_path_questions)
parsed_questions = JSON.parse(serialised_questions)

parsed_questions.each do |question|
  content = question["question"]
  options = question["options"]

  Question.create(content: content, options: options)
end
