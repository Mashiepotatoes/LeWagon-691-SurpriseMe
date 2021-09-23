# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'
require 'faker'

Product.destroy_all
Category.destroy_all

# Product.create(name: "Xiaomi Mi Vacuum Cleaner Mini", price: 69.90, description: "A small-format wireless hand vacuum cleaner. It has two speeds, so you can adapt it to everything you need. Light and portable.")
# Product.create(name: "Jabra Elite 3 Earbuds", price: 128, description: "Designed for secure fit and amazing durability: Ergonomic shape makes eargels exceptionally comfortable and the ideal fit for every type of ear – IP55 weather-resistant rating against dust and water. Long battery life and true wireless stability: With up to 28 hours of battery time with the pocket-friendly charging case, the Elite 3 earphones let you take calls and play music while staying connected.")
# Product.create(name: "ARSSOO Cocktail Kit Bar Set. 15PC Professional Bartender Kit. 25oz Cocktail Shaker, 19oz Martini Shaker, Drink Mixer, Muddler Tool, Bar Strainer, Wine Opener, Jigger x2, Pourers and Bar Accessories", price: 69.99, description: "Mixology Home Mastery: Everything you need to have for making any drinks. Only the Arssoo Cocktail set comes with 2 different sized bar shakers and 4 different sized cocktail jiggers. In addition, you get Cocktail Recipe E-Book and Mixology Videos.")
# Product.create(name: "Adjustable Laptop Stand Oli & Ode Table Stand Portable Ergonomic Notebook Stand with Heat-Vent, Heavy Duty Laptop Holder Compatible with MacBook Pro/Air, Dell, HP, other laptop", price: 29.50, description: " This adjustable multi-angle laptop stand elevates your laptop screen for a perfect eye level and helps to reduce neck/shoulder/back pain and eye strain and promotes proper posture while sitting. The laptop holder fits all laptops 10 to 17 inches, such as MacBook 12/13, MacBook Air 13, Macbook Pro 13/15, Google Pixelbook, Dell XPS, HP, ASUS, Lenovo, ThinkPad, Acer, Chromebook and other notebook PC computer.")
# Product.create(name: "STOGA 60% Gaming Keyboard, RGB Mechanical Keyboard, Small 61-Key Wired Brown Switch Mini Keyboard, White Computer Keyboard for Gaming/Office/PC/Mac", price: 56.99, description: "STOGA Gaming keyboard structure is small and easy to carry. The mechanical keyboard's detachable USB Type-C cable design is easy to store, freeing up your desktop working space. The wired gaming keyboard can provide a stable link, no delay, no lag. 60% Mechanical keyboard with a USB 2.0 transfer speed, click feedback and an excellent typing experience is a professional standard for typists and gamers.")
# Product.create(name: "Apple AirPods Pro", price: 280.00, description: "Active Noise Cancellation for immersive sound. Transparency mode for hearing and connecting with the world around you. Three sizes of soft, tapered silicone tips for a customisable fit. Sweat and water resistant. Adaptive EQ automatically tunes music to the shape of your ear. Easy setup for all your Apple devices. Quick access to Siri by saying Hey Siri. The Wireless Charging Case delivers more than 24 hours of battery life.")
# Product.create(name: "Dreamegg Cool Mist Humidifier - Ultrasonic Humidifiers for Bedroom, Baby & Home, Whisper Quiet Filter-Free Air Humidifier with 360° Mist Nozzle, Timer Setting, Night Light Option & Auto Shut-Off", price: 59.92, description: "OPERATES RELIABLY IN SILENCE - Noise level is ≤30dB. No buzzing, hissing, or humming. This humidifier steadily and efficiently dispenses the soothing cool mist you need. 100,000+ happy users sleep better with Dreamegg. CONTROL AT YOUR FINGERTIPS - Designed with super simple intuitive interface & buttons. 360° mist nozzle: easily direct the flow of mist away from areas that don't need moisture and toward the areas that do. Easy to set up 1h/3h/6h timer before ready for bed.")
# Product.create(name: "NYX PROFESSIONAL MAKEUP Ultimate Shadow Palette, Eyeshadow Palette, Warm Neutrals", price: 28.60, description: "EYESHADOW PALETTE: This professional level makeup palette features 16 highly-pigmented shadows that glide onto lids & make eyes pop with color. Use with NYX Professional makeup eyeshadow primer for bolder, longer-lasting color. ULTIMATE EYE SHADOW: Each high quality eyeshadow palette features a highly pigmented mix of finishes from matte & satin to shimmery & metallic—perfect for your skin tone. Apply primer & build your look. BOLD & BEAUTIFUL: Eyes pop with NYX PROFESSIONAL MAKEUP eye shadow collection. Choose from eyeshadow primer, matte eyeshadow, cream eyeshadows, gel eyeshadows, liquid eyeshadows, & more with a variety of different finishes to complete your look.")
# Product.create(name: "Expandable Cat Carrier Backpack for Cats, Space Capsule Bubble Pet Travel Carrier for Small Dog, Pet Hiking Traveling Backpack (Green, Expandable Backpack - Solid Hard)", price:137.19, description: "Expandable Bubble Backpack for Cat: Wider visual view from the bubble dome. Expandable back panel to give more room and play time at outdoor activity. Breathable and Ventilation: Extra 9 holes around this pet carrier and two side windows to perform great air circulation and ventilation inside. Expanded back panel to be a giant tent bed to enjoy outdoor time with nature and sunshine well without feeling stuffiness in the backpack. Order the extra floral vent cover to get ever ventilation. Eye-catching and Lightweight: Entire backpack is less than 3 lbs only, suggest for cats from 0-12lbs and small dogs from 0-10lbs to leave enough room inside to turn around. Airline Approved backpack for cats and puppy. Super wear-resistant shell perfectly against biting and scratching by pets. Portable and Shoulder-Wear: Padded shoulder straps pet carrier backpack with adjustable chest buckle for travel and hiking outdoor activity")
# Product.create(name: "LONDONTOWN kur Nail Hardener and Base Coat", price: 30.00, description: "Works to penetrate and replenish deteriorated nail protein and balance natural oils in the nail to strengthen and nourish them back to health. Created with Britain's rapeseed flower oil as well as a unique blend of natural extracts and vitamins to rejuvenate and restore moisture to dry, thin and brittle nails. Sts a strong base to nails. Vegan, gluten-free and cruelty-free. 5-free formula, formaldehyde-free, toluene-free, DBP-free, formaldehyde resin-free, camphor free.")

# # electronics = Category.create(name: "Electronics")
# all_beauty = Category.create(name: "Beauty & Cosmetics")
# video_games = Category.create(name: "Video Games")
# cd_vinyl = Category.create(name: "CD & Vinyl Records")
# pet_essentials = Category.create(name: "Pet Essentials")
# toys_games = Category.create(name: "Toys & Games")
# # home_lifestyle = Category.create(name: "Home & Lifestyle")

# # ---- Amazon all_beauty Seeds ---- #
# file_path_beauty = File.join(__dir__, "amazon_datasets/all_beauty.json")
# serialised_all_beauty = File.read(file_path_beauty)
# parsed_all_beauty = JSON.parse(serialised_all_beauty)

# # ---- Amazon video_games seeds ---- #
# file_path_vg = File.join(__dir__, "amazon_datasets/video_games.json")
# serialised_video_games = File.read(file_path_vg)
# parsed_video_games = JSON.parse(serialised_video_games)

# # ---- Amazon cd_vinyl seeds ---- #
# file_path_cdv = File.join(__dir__, "amazon_datasets/cd_vinyl.json")
# serialised_cd_vinyl = File.read(file_path_cdv)
# parsed_cd_vinyl = JSON.parse(serialised_cd_vinyl)

# # ---- Amazon pet_supplies seeds ---- #
# file_path_ps = File.join(__dir__, "amazon_datasets/pet_supplies.json")
# serialised_pet_supplies = File.read(file_path_ps)
# parsed_pet_supplies = JSON.parse(serialised_pet_supplies)

# # ---- Amazon toys_games seeds ---- #
# file_path_tg = File.join(__dir__, "amazon_datasets/toys_games.json")
# serialised_toys_games = File.read(file_path_tg)
# parsed_toys_games = JSON.parse(serialised_toys_games)

# # ---- seeding ---- #
# parsed_datasets = [parsed_all_beauty, parsed_video_games, parsed_pet_supplies, parsed_cd_vinyl, parsed_toys_games] 
# categories = [all_beauty, video_games, cd_vinyl, pet_essentials, toys_games] 

# categories_index = 0

# parsed_datasets.each do |dataset| 
#   dataset.each do |product|
#     puts "Creating #{product["title"]}..."

#     name = product["title"]
#     description = product["description"].join
#     asin = product["asin"] # product number
#     image_url = product["imageUrlHighRes"]
#     brand = product["brand"]
#     price = product["price"]
    
#     product = Product.new(name: name, description: description, price: price.to_s, asin: asin, image_url: image_url, brand: brand)
#     product.category = categories[categories_index]

#     product.save!
#     puts "#{product["title"]} saved"
#   end
#   categories_index += 1
# end

# puts "Finished seeding"

# ---- Create Users ---- #

50.times do |i|
  puts "creating user #{i + 1}"
  User.create(
    # name: Faker::Name.name, 
    address: Faker::Address.full_address,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 8)
  )
  puts "created user #{i + 1}"
end

# ---- Create Reviews