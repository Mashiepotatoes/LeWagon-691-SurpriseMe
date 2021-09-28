require 'json'
require 'open-uri'
require 'faker'

<<<<<<< HEAD
Product.destroy_all
Category.destroy_all

Category.create(name: "Electronics")
category = Category.find(1)
# ------ Jeremy and PE seeds ----- #
# console.log("Seeding products!")
# Product.create(image_url:"https://source.unsplash.com/random",category:category, name: "Xiaomi Mi Vacuum Cleaner Mini", price: 69.90, description: "A small-format wireless hand vacuum cleaner. It has two speeds, so you can adapt it to everything you need. Light and portable.")
# Product.create(image_url:"https://source.unsplash.com/random",category:category,name: "Jabra Elite 3 Earbuds", price: 128, description: "Designed for secure fit and amazing durability: Ergonomic shape makes eargels exceptionally comfortable and the ideal fit for every type of ear – IP55 weather-resistant rating against dust and water. Long battery life and true wireless stability: With up to 28 hours of battery time with the pocket-friendly charging case, the Elite 3 earphones let you take calls and play music while staying connected.")
# Product.create(image_url:"https://source.unsplash.com/random",category:category,name: "ARSSOO Cocktail Kit Bar Set. 15PC Professional Bartender Kit. 25oz Cocktail Shaker, 19oz Martini Shaker, Drink Mixer, Muddler Tool, Bar Strainer, Wine Opener, Jigger x2, Pourers and Bar Accessories", price: 69.99, description: "Mixology Home Mastery: Everything you need to have for making any drinks. Only the Arssoo Cocktail set comes with 2 different sized bar shakers and 4 different sized cocktail jiggers. In addition, you get Cocktail Recipe E-Book and Mixology Videos.")
# Product.create(image_url:"https://source.unsplash.com/random",category:category,name: "STOGA 60% Gaming Keyboard, RGB Mechanical Keyboard, Small 61-Key Wired Brown Switch Mini Keyboard, White Computer Keyboard for Gaming/Office/PC/Mac", price: 56.99, description: "STOGA Gaming keyboard structure is small and easy to carry. The mechanical keyboard's detachable USB Type-C cable design is easy to store, freeing up your desktop working space. The wired gaming keyboard can provide a stable link, no delay, no lag. 60% Mechanical keyboard with a USB 2.0 transfer speed, click feedback and an excellent typing experience is a professional standard for typists and gamers.")
# Product.create(image_url:"https://source.unsplash.com/random",category:category,name: "Apple AirPods Pro", price: 280.00, description: "Active Noise Cancellation for immersive sound. Transparency mode for hearing and connecting with the world around you. Three sizes of soft, tapered silicone tips for a customisable fit. Sweat and water resistant. Adaptive EQ automatically tunes music to the shape of your ear. Easy setup for all your Apple devices. Quick access to Siri by saying Hey Siri. The Wireless Charging Case delivers more than 24 hours of battery life.")
# Product.create(image_url:"https://source.unsplash.com/random",category:category,name: "Dreamegg Cool Mist Humidifier - Ultrasonic Humidifiers for Bedroom, Baby & Home, Whisper Quiet Filter-Free Air Humidifier with 360° Mist Nozzle, Timer Setting, Night Light Option & Auto Shut-Off", price: 59.92, details: "OPERATES RELIABLY IN SILENCE - Noise level is ≤30dB. No buzzing, hissing, or humming. This humidifier steadily and efficiently dispenses the soothing cool mist you need. 100,000+ happy users sleep better with Dreamegg. CONTROL AT YOUR FINGERTIPS - Designed with super simple intuitive interface & buttons. 360° mist nozzle: easily direct the flow of mist away from areas that don't need moisture and toward the areas that do. Easy to set up 1h/3h/6h timer before ready for bed.")
# Product.create(image_url:"https://source.unsplash.com/random",category:category,name: "NYX PROFESSIONAL MAKEUP Ultimate Shadow Palette, Eyeshadow Palette, Warm Neutrals", price: 28.60, details: "EYESHADOW PALETTE: This professional level makeup palette features 16 highly-pigmented shadows that glide onto lids & make eyes pop with color. Use with NYX Professional makeup eyeshadow primer for bolder, longer-lasting color. ULTIMATE EYE SHADOW: Each high quality eyeshadow palette features a highly pigmented mix of finishes from matte & satin to shimmery & metallic—perfect for your skin tone. Apply primer & build your look. BOLD & BEAUTIFUL: Eyes pop with NYX PROFESSIONAL MAKEUP eye shadow collection. Choose from eyeshadow primer, matte eyeshadow, cream eyeshadows, gel eyeshadows, liquid eyeshadows, & more with a variety of different finishes to complete your look.")
# Product.create(image_url:"https://source.unsplash.com/random",category:category,name: "Expandable Cat Carrier Backpack for Cats, Space Capsule Bubble Pet Travel Carrier for Small Dog, Pet Hiking Traveling Backpack (Green, Expandable Backpack - Solid Hard)", price:137.19, details: "Expandable Bubble Backpack for Cat: Wider visual view from the bubble dome. Expandable back panel to give more room and play time at outdoor activity. Breathable and Ventilation: Extra 9 holes around this pet carrier and two side windows to perform great air circulation and ventilation inside. Expanded back panel to be a giant tent bed to enjoy outdoor time with nature and sunshine well without feeling stuffiness in the backpack. Order the extra floral vent cover to get ever ventilation. Eye-catching and Lightweight: Entire backpack is less than 3 lbs only, suggest for cats from 0-12lbs and small dogs from 0-10lbs to leave enough room inside to turn around. Airline Approved backpack for cats and puppy. Super wear-resistant shell perfectly against biting and scratching by pets. Portable and Shoulder-Wear: Padded shoulder straps pet carrier backpack with adjustable chest buckle for travel and hiking outdoor activity")
# Product.create(image_url:"https://source.unsplash.com/random",category:category,name: "LONDONTOWN kur Nail Hardener and Base Coat", price: 30.00, details: "Works to penetrate and replenish deteriorated nail protein and balance natural oils in the nail to strengthen and nourish them back to health. Created with Britain's rapeseed flower oil as well as a unique blend of natural extracts and vitamins to rejuvenate and restore moisture to dry, thin and brittle nails. Sets a strong base to nails. Vegan, gluten-free and cruelty-free. 5-free formula, formaldehyde-free, toluene-free, DBP-free, formaldehyde resin-free, camphor free.")
# Product.create(image_url:"https://source.unsplash.com/random",category:category,name: "KOETSU paddle board standup paddle board beginner surf board water ski board inflatable paddle board", price: 284.13, details: "Includes tail fin, foot rope, oneway pump, repair kit.")
# Product.create(image_url:"https://source.unsplash.com/random",category:category,name: "Wheeled Golf Travel Cover Bag for Airlines Shipping Storage Carrier Black", price: 49.23, details: "Premium Nylon cloth golf bag travel golf club protector, dustproof, folding, lightweight and durable, can be used many times. Suitable for car or air transport. The bottom is equipped with non-slip foot pads, pulley design, easy towing. Half open double sided zipper for easy use, transparent pocket for your business card. Unique foldable design, convenient storage, suitable for outing use.")
# Product.create(image_url:"https://source.unsplash.com/random",category:category,name: "LYY_Dual-purpose Folding Camping Beach Chair with Backrest for Outdoor Activities", price: 55.30, details: "The side pocket design can place mobile phones or other objects. Concave-convex pattern design can easily cope with a variety of grounds. The non-slip plastic foot cover prevents slipping. Aluminum alloy folding bracket is light, strong and not easy to deform, and high-density double-layer Oxford cloth is durable, comfortable, breathable and not stuffy. The length of the product is 82cm, the width is 44cm, and the thickness is 30cm. It is suitable for picnic, camping, fishing, traveling, outing, etc.")
# Product.create(image_url:"https://source.unsplash.com/random",category:category,name: "Bicycle Wall Hook Stand Bike Mounted Mount Storage Hanger Adjustable activity Rack", price: 8.13, details: "Features: Bicycle Wall Mount Hanger for hanging the bike vertically to save space. Made of strong solid steel,load capacity up to 30kg. Fits on any solid wall. Four mounting points and side special design make fasten sturdy. Suitable for all type bikes like Mountain bikes,road bikes,folding bikes etc. Specification: Load Capacity: 30kg. Material: High Quality Strong Steel, High Graded Rubber. Product dimensions (L x W x H): 26 x 7.5 x 13.5cm")
=======
# Product.destroy_all
# Category.destroy_all
# Order.destroy_all
# Rating.destroy_all
# Question.destroy_all

>>>>>>> create some fake data for disco gem
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
