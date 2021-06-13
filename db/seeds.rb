# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Game.create(name: 'Half Life 3', status: 'unreleased')
Game.create!(name: 'Battlefield V', status: 'cracked', anti_tamper: 'EA',
             image_url: 'https://data1.origin.com/asset/content/dam/originx/web/app/games/battlefield/battlefield-v/battlefieldv_standard-edition_gdp_header_2400x600_en_US.jpg/158492ec-17ce-4a6e-a85e-5b8447fc2bd8/original.jpg', store_url: 'https://www.origin.com/arg/es-es/store/battlefield/battlefield-v', cracked_by: 'Darck', crack_date: '12-06-2021', release_date: '20-11-2018')
