# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Restaurant.destroy_all

user1 = User.create(email: '1@1.com', '12345678', '12345678')	
user2 = User.create(email: '2@2.com', '12345678', '12345678')	
user2 = User.create(email: '2@2.com', '12345678', '12345678')	

restaurant1 = user1.Restaurant.create(name: 'Red Dog Saloon', cuisine: 'Diner')
restaurant2 = user2.Restaurant.create(name: 'Duck and Waffle', cuisine: 'British')
restaurant3 = user3.Restaurant.create(name: 'NanBan', cuisine: 'Japanese')

review1 = restaurant1.reviews.create(	:rating => '4', :comment => 'Great', :user_id => user2.id)
review2 =restaurant1.reviews.create(	:rating => '3', :comment => 'Good food, but disappointing service', :user_id => user3.id)

review3 =restaurant2.reviews.create(	:rating => '1', :comment => 'Poor', :user_id => user1.id)
review4 =restaurant2.reviews.create(	:rating => '2', :comment => 'Interesting menu, bad execution', :user_id => user3.id)

review5 =restaurant3.reviews.create(	:rating => '5', :comment => 'Great!', :user_id => user1.id)
review6 =restaurant3.reviews.create(	:rating => '5', :comment => 'Unbelievable!', :user_id => user2.id)

review1.rubbish(user_id: user1.id)
review1.rubbish(user_id: user2.id)
review2.rate(user_id: user3.id)

review3.rubbish(user_id: user1.id)
review3.rate(user_id: user3.id)
review3.rate(user_id: user2.id)