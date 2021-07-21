# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
oldpoliticians = Politician.all
oldpoliticians.each { |politician| politician.picture.purge }
oldparties = PoliticalParty.all
oldparties.each { |party| party.picture.purge }

User.create!(username: "admin",
             password: "asdasd",
             password_confirmation: "asdasd"
            )

4.times do |n|
  name  = Faker::Cosmere.knight_radiant
  founding = Faker::Date.backward(days: 999)
  political_compass = "Izquierda libertaria"
  coalition = "none"
  founding_ideology = "marxismo"
  principles = "facebook.com"
  #pol = 
  PoliticalParty.create!(name:  name,
                         founding: founding,
                         political_compass: political_compass,
                         coalition: coalition,
                         founding_ideology: founding_ideology,
                         principles: principles)
# pol.picture.attach(
#    io: File.open('storage/a/Retrato_Oficial_Presidente_Piñera_2018.jpg'),
#    filename: 'Retrato_Oficial_Presidente_Piñera_2018.jpg'
#  )
end
parties = PoliticalParty.order(:created_at).take(10)
5.times do
parties.each { |party| party.politicians.create!(name: Faker::Name.name,
                                                 birthdate: Faker::Date.backward(days: 30000),
                                                 position: Faker::Job.title,
                                                 political_compass: "izquierda libertaria",
                                                 previous_position: Faker::Job.title,
                                                 education: Faker::Lorem.sentence(word_count: 3),
                                                 president: false
                                                 )
             }
parties.each { |party| party.news.create!(title: Faker::Lorem.sentence(word_count: 6),
                                          link: Faker::Internet.url,
                                          release: Faker::Date.backward(days: 300),
                                          email: Faker::Internet.email,
                                          state: false
                                         )
             }
end
politicians = Politician.all
5.times do
politicians.each { |politician| politician.news.create!(title: Faker::Lorem.sentence(word_count: 6),
                                          link: Faker::Internet.url,
                                          release: Faker::Date.backward(days: 300),
                                          email: Faker::Internet.email,
                                          state: true
                                         )
             }
end
politicians.each { |politician| politician.picture.attach(
                                                          io: URI.open(Faker::LoremFlickr.image(size: "400x300", search_terms: ['sports'])),
                                                          filename: 'pototo.png'
                                                         )
                 }
parties.each { |politician| politician.picture.attach(
                                                          io: URI.open(Faker::LoremFlickr.image(size: "400x300", search_terms: ['sports'])),
                                                          filename: 'potota.png'
                                                         )
                 }
