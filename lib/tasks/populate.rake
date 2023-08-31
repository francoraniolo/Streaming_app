namespace :db do
  desc 'Populate the database with sample data'
  task populate: :environment do
    movie_data = [
      { title: "Spirited away", plot: "During her family's move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches and spirits, a world where humans are changed into beasts." },
      { title: "Howl's moving castle", plot: "When an unconfident young woman is cursed with an old body by a spiteful witch, her only chance of breaking the spell lies with a self-indulgent yet insecure young wizard and his companions in his legged, walking castle." },
      { title: "Porco Rosso", plot: "In 1930s Italy, a veteran World War I pilot is cursed to look like an anthropomorphic pig." },
      { title: "Akira", plot: "A secret military project endangers Neo-Tokyo when it turns a biker gang member into a rampaging psychic psychopath who can only be stopped by a teenager, his gang of biker friends and a group of psychics." },
      { title: "The Godfather", plot: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son." }
    ]

    season_data = [
      { title: "Fighting Spirit", plot: "Ippo, a teenage boy with a pure heart and unrelenting determination, discovers a passion for boxing after veteran fighter Takamura saves him from bullies." },
      { title: "Vinland Saga", plot: "Thorfinn pursues a journey with his father's killer in order to take revenge and end his life in a duel as an honorable warrior and pay his father a homage." },
      { title: "Stranger Things", plot: "When a young boy disappears, his mother, a police chief, and his friends must confront terrifying supernatural forces to get him back." },
      { title: "Game of Thrones", plot: "Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for millennia." }
    ]

    # Create movies
    movie_data.each do |data|
      Movie.create(title: data[:title], plot: data[:plot])
    end

    # Create seasons and episodes
    season_data.each_with_index do |data, index|
      season = Season.create(title: data[:title], plot: data[:plot], number: index + 1)

      5.times do |episode_num|
        Episode.create(title: "Episode #{episode_num + 1}", plot: Faker::Lorem.paragraph, number: episode_num + 1, season: season)
      end
    end

    # Create purchase options
    Movie.all.each do |movie|
      PurchaseOption.create(purchasable: movie, price: 2.99, video_quality: PurchaseOption.video_qualities.keys.sample)
    end

    Season.all.each do |season|
      PurchaseOption.create(purchasable: season, price: 2.99, video_quality: PurchaseOption.video_qualities.keys.sample)
    end

    # Create users
    10.times do
      User.create(email: Faker::Internet.email)
    end

    # Create purchases and library items
    User.all.each do |user|
      3.times do
        purchase_option = PurchaseOption.all.sample
        CreatePurchase.call(user, purchase_option) if user.library_items.where(product: purchase_option.purchasable).empty?
      end
    end
  end
end
