# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


admin = Admin.create!(:email => "admin@mail.com",
                 :password => "admin1",
                 :password_confirmation => "admin1")
p "Created admin"

res_eat_good = Restaurant.create!(:title => "La Lampada",
                                  :lat => 41.90723,
                                  :lng => 12.49658,
                                  
                                  :description => "Fish",
                                  :image => "https://media-cdn.tripadvisor.com/media/photo-s/18/5e/17/62/restaurant.jpg")
 Restaurant.create!(:title => "Salvo",
                                  :lat => 42.37012,
                                  :lng => 19.24702,
                                  :description => "Grill",
                                  :image => "https://img.freepik.com/free-photo/restaurant-hall-with-red-brick-walls-wooden-tables-pipes-ceiling_140725-8504.jpg?w=2000")

 Restaurant.create!(:title => "Ciro Purpetta",
                                  :lat => 41.90531,
                                  :lng => 12.50170,
                                  :description => "Vegan",
                                  :image => "https://cdn.londonandpartners.com/-/media/images/london/visit/things-to-do/food-and-drink/restaurants/sketch/sketch-restaurant-the-gallery-yellow-2022-640x360.jpg?mw=640&hash=04D57E17D11D4A9B7969F290056583F42EB282E0")
                                  
Restaurant.create!(:title => "Casmocio D'Abruzzo",
                                    :lat => 41.90531,
                                    :lng => 12.50250,
                                    :description => "Grill",
                                    :image => "https://static.wixstatic.com/media/f0f42d_8964bcd019514071a74e0ac26449bec8~mv2.jpg/v1/fill/w_640,h_494,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/f0f42d_8964bcd019514071a74e0ac26449bec8~mv2.jpg")
 Restaurant.create!(:title => "Avon",
                                  :lat => 41.17372,
                                  :lng => 20.68626,
                                  :description => "Grill",
                                  :image => "https://media-cdn.tripadvisor.com/media/photo-s/06/4a/ba/2b/2.jpg")
 
 Restaurant.create!(:title => "Dredheza Beach",
                                  :lat => 41.17276,
                                  :lng => 20.68248,
                                  :description => "Fish",
                                  :image => "https://10619-2.s.cdn12.com/rests/original/404_52136220.jpg")
                                  
 Restaurant.create!(:title => "Vanila Plaza",
                                  :lat => 41.17269,
                                  :lng => 20.68314,
                                  :description => "Grill",
                                  :image => "https://10619-2.s.cdn12.com/c2/Restaurant-Vanila-Plazza-interior.jpg")
                                    
 Restaurant.create!(:title => "QUALAQI",
                                  :lat => 41.71321,
                                  :lng => 44.82193,
                                  :description => "Lux",
                                  :image => "https://media-cdn.tripadvisor.com/media/photo-s/12/34/29/d9/getlstd-property-photo.jpg")
 
 Restaurant.create!(:title => "Marani",
                                  :lat => 41.68786,
                                  :lng => 44.81133,
                                  :description => "Meat",
                                  :image => "https://media-cdn.tripadvisor.com/media/photo-s/12/91/fd/4c/the-most-luxury-retaurant.jpg")

 Restaurant.create!(:title => "Leila",
                                  :lat => 41.69555,
                                  :lng => 44.80649,
                                  :description => "Traditional",
                                  :image => "https://sakurageorgia.com/storage/app/media/uploaded-files/16602613_1857588131152001_5625685027364401548_n.jpg")

 Restaurant.create!(:title => "Porto",
                                  :lat => 42.44379,
                                  :lng => 19.26145,
                                  :description => "Lux",
                                  :image => "https://foodbook.me/storage/restaurants/467/Lgxabb3zPxdDqL3TJLzf4WDLM454Dw3xn5nRlNnX.jpeg")
 
 Restaurant.create!(:title => "Lanterna",
                                  :lat => 42.42698,
                                  :lng => 19.26046,
                                  :description => "Konoba",
                                  :image => "https://media-cdn.tripadvisor.com/media/photo-s/06/6b/3e/3e/lanterna-podgorica.jpg")

 Restaurant.create!(:title => "Pod Volat",
                                  :lat => 42.43537,
                                  :lng => 19.25975,
                                  :description => "Traditional",
                                  :image => "https://media-cdn.tripadvisor.com/media/photo-s/06/ce/3f/29/pod-volat.jpg")


p "Restaurants created"

configuration_1 = SeatsConfiguration.new(:restaurant_id => res_eat_good.id)

20.times do |number|
  configuration_1.seats.new(:x => rand(10), :y => rand(10))
end
configuration_1.save!
p "Created seats"

every_nice = Restaurant.create!(:title => "Del Secolo",
                                :lat => 41.90465,
                                :lng => 12.50494,
                                :description => "Grill",
                                :image => "https://img.tuscanyaccommodation.com/properties/il-chiostro-del-carmine/il-chiostro-del-carmine_7_tinaia_-_chiostro_del_carmine.jpg?fit=clip&h=900")
configuration_1 = SeatsConfiguration.new(:restaurant_id => every_nice.id)

20.times do |number|
  configuration_1.seats.new(:x => rand(10), :y => rand(10))
end
configuration_1.save!

all_u_can_eat = Restaurant.create!(:title => "L'Idea",
                                   :lat => 41.90464,
                                   :lng => 12.50593,
                                   :description => "Vegetables",
                                   :image => "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&w=1000&q=80")
configuration_1 = SeatsConfiguration.new(:restaurant_id => all_u_can_eat.id)

20.times do |number|
  configuration_1.seats.new(:x => rand(10), :y => rand(10))
end
configuration_1.save!

meals = ["Soup", "Rigoto", "Tacos", "Fish", "Stake", "Bread", "Cheese",
         "Carrots", "Pork", "Cake"]
descriptions = ["Delicious", "Nice", "Mouth-watering", "Pleasing", "Eatable", "Cheap",
                "Easy", "Hard"]

Restaurant.all.each do |restaurant|
  5.times do
    restaurant.menu.meals.create!(:title => meals[rand(8)],
                                  :description => descriptions[rand(7)],
                                  :price => rand(1000))
  end
end

p "Created restaurants and seats configurations"


first_names = [ "Nicole", "Robert", "John", "Peter", "Tracy", "Mike", "Luke" ]
last_names = [ "More", "Ras", "Pas", "Gars", "Leri", "Oldman", "Doe" ]
# 10.times do |number|
#   manager = Manager.new(:email => "manager_#{number}@mail.com",
#                         :first_name => first_names[rand(6)],
#                         :last_name => last_names[rand(6)],
#                         :phone_number => "+1#{rand(100)}1#{rand(200)}",
#                         :password => "manager",
#                         :password_confirmation => "manager",
#                         :restaurant => res_eat_good,
#                         :lat => rand(45.244..45.269),
#                         :lng => rand(19.8233..19.83467),
#                         :confirmed_at => DateTime.now)

#   manager.save!
# end
# p "Created managers"



valid_email = [ "john@gmail.com",
                "robert@gmail.com", "kane@gmail.com", "elia@gmail.com",
                "queen@gmail.com", "yay@gmail.com", "kimler@live.com",
                "wow@gmail.com" ]

valid_email.count.times do |number|
  guest = Guest.new(:email => valid_email[number],
                    :first_name => first_names[rand(6)],
                    :last_name => last_names[rand(6)],
                    :phone_number => "3435#{rand(100)}1#{rand(200)}",
                    :password => "guestguest",
                    :password_confirmation => "guestguest",
                    :lat => rand(45.244..45.269),
                    :lng => rand(19.8233..19.83467),
                    :confirmed_at => DateTime.now)
  guest.save!

  unless number == 0 || number == valid_email.count
    friend = Guest.where.not(:email => guest.email).offset(rand(number)).first
    Friendship.create(:user_id => guest.id, :friend_id => friend.id)
    Friendship.create(:friend_id => guest.id, :user_id => friend.id)
  end
end

p "Created users and reservations"