# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
    User.destroy_all
    Artwork.destroy_all
    ArtworkShare.destroy_all
  
    users = []
  
    spenny = User.create!(username: "radio_man")
    users << spenny
  
    diego = User.create!(username: 'xX_CsS_GoD_Xx')
    users << diego
    
    mike = User.create!(username: 'squeakycheese')
    users << mike
  
    melissa = User.create!(username: 'fast_typer')
    users << melissa
  
    jack = User.create!(username: "of_all_trades")
    users << jack
  
    charis = User.create!(username: "chairis")
    users << charis
    
    andy = User.create!(username: "the_man")
    users << andy
  
    quotes = []
  
    until quotes.length == 12
      quotes << Faker::TvShows::RickAndMorty.character
      quotes.uniq!
    end
  
    Artwork.create!(artist_id: mike.id,image_url: "/somewhere_random/" ,title: quotes.pop)
    Artwork.create!(artist_id: mike.id,image_url: "/somewhere_random/" ,title: quotes.pop)
    Artwork.create!(artist_id: diego.id,image_url: "/somewhere_random/" ,title: quotes.pop)
    Artwork.create!(artist_id: diego.id,image_url: "/somewhere_random/" ,title: quotes.pop)
    Artwork.create!(artist_id: spenny.id,image_url: "/somewhere_random/" ,title: quotes.pop)
    Artwork.create!(artist_id: spenny.id,image_url: "/somewhere_random/" ,title: quotes.pop)
    Artwork.create!(artist_id: jack.id,image_url: "/somewhere_random/" ,title: quotes.pop)
    Artwork.create!(artist_id: charis.id,image_url: "/somewhere_random/" ,title: quotes.pop)
    Artwork.create!(artist_id: charis.id,image_url: "/somewhere_random/" ,title: quotes.pop)
    Artwork.create!(artist_id: melissa.id,image_url: "/somewhere_random/" ,title: quotes.pop)
    Artwork.create!(artist_id: andy.id,image_url: "/somewhere_random/" ,title: quotes.pop)
  
  
    Artwork.all.each do |artwork|
      users = User.all.to_a
      (1..3).to_a.sample.times do
        random_user = users.sample
        users.delete(random_user)
        ArtworkShare.create(viewer_id: random_user.id, artwork_id: artwork.id)
      end
    end

    comments = []

    until comments.length == 12
      comments << Faker::ChuckNorris.fact
      comments.uniq!
    end

    while !comments.empty?
      Comment.create!(user_id: User.all.sample[:id],artwork_id: Artwork.all.sample[:id],body: comments.pop)
    end

end
  
  
