namespace :setup_disco do
  task fit: :environment do
    puts "fitting data to disco"
    data = Rating.all.map do |rating|
      {
        user_id: rating.user.id,
        item_id: rating.product.id,
        rating: rating.rating
      }
    end
    recommender = Disco::Recommender.new
    recommender.fit(data)

    User.find_each do |user|
      p "saving recommendation for user: #{user.id}"
      recs = recommender.user_recs(user.id)
      user.update_recommended_products(recs)
    end
  end
end
