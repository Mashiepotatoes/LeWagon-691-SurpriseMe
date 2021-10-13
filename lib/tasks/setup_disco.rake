namespace :setup_disco do
  task fit: :environment do
    puts "fitting data to disco"
    # take all the ratings available in the database and extract user, item and rating and create dataset
    data = Rating.all.map do |rating|
      {
        user_id: rating.user.id,
        item_id: rating.product.id,
        rating: rating.rating
      }
    end
    # create the recommender and fit it with the data set.
    recommender = Disco::Recommender.new
    recommender.fit(data)

    # for each user, save their recommendations
    User.find_each do |user|
      p "saving recommendation for user: #{user.id}"
      recs = recommender.user_recs(user.id, count: 20)
      user.update_recommended_products(recs)
    end
  end
end
