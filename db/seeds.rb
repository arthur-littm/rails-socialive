# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Livestream.destroy_all
User.destroy_all

user1 = User.create({
  email: 'remi.dyvoire@gmail.com',
  password: '123456',
  livestreamer: true,
  })

user2 = User.create({
  email: 'sandrine@gmail.com',
  first_name: 'sandrine',
  password: '123456',
  livestreamer: true,
  })

user3 = User.create({
  email: 'gustave@gmail.com',
  password: '123456',
  })

user4 = User.create({
  email: 'marcel@gmail.com',
  password: '123456',
  })

livestream1 = Livestream.create({
  title: 'How to cook like a pro',
  category: 'foodie',
  })

livestream2 = Livestream.create({
  title: 'Morning yoga with Sandrine',
  category: 'fitness',
  })

livestream3 = Livestream.create({
  title: 'Morning yoga with Theo',
  category: 'fitness',
  })

livestream4 = Livestream.create({
  title: 'Morning yoga with Evan',
  category: 'fitness',
  })

livestream5 = Livestream.create({
  title: 'Morning cooking with Evan',
  category: 'foodie',
  })

livestream1.user = user1
livestream3.user = user1
livestream4.user = user1
livestream2.user = user2
livestream5.user = user1

user1.save!
user2.save!
user3.save!
user4.save!

livestream1.save!
livestream2.save!
livestream3.save!
livestream4.save!
livestream5.save!


