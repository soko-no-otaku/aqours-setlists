# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

first = Event.create(title: 'Aqours First LoveLive! ～Step! ZERO to ONE～ Day.1', started_at: '2017-02-25 17:30')
first.songs.create(title: '青空Jumping Heart', released_at: '2016-07-20')
first.songs.create(title: '恋になりたいAQUARIUM', released_at: '2016-04-27')
