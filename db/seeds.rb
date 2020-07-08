# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require 'faker'
require_relative '../config/key'

Category.destroy_all
User.destroy_all
Order.destroy_all
Artifact.destroy_all

# sculpture_url = 'https://api.harvardartmuseums.org/object?apikey=#{KEY}&classification=Sculpture&page=10'
# painting_url = 'https://api.harvardartmuseums.org/object?apikey=#{KEY}&classification=Paintings&page=10'
# drawing_url = 'https://api.harvardartmuseums.org/object?apikey=#{KEY}&classification=Drawings&page=10'
# photograph_url = 'https://api.harvardartmuseums.org/object?apikey=#{KEY}&classification=Photographs&page=10'
# jewelry_url = 'https://api.harvardartmuseums.org/object?apikey=#{KEY}&classification=Jewelry&page=10'
# tablets_url = 'https://api.harvardartmuseums.org/object?apikey=#{KEY}&classification=Tablets&page=10'
# coins_url = 'https://api.harvardartmuseums.org/object?apikey=#{KEY}&classification=Coins&page=10'
# stainedglass_url = 'https://api.harvardartmuseums.org/object?apikey=#{KEY}&classification=Stained Glass&page=10'
# archelements_url = 'https://api.harvardartmuseums.org/object?apikey=#{KEY}&classification=Architectural Elements&page=10'
# mosaics_url = 'https://api.harvardartmuseums.org/object?apikey=#{KEY}&classification=Mosaics&page=5'

urls = 
    ["https://api.harvardartmuseums.org/object?apikey=#{KEY}&classification=Architectural%20Elements&page=",
    "https://api.harvardartmuseums.org/object?apikey=#{KEY}&classification=Drawings&page=",
    "https://api.harvardartmuseums.org/object?apikey=#{KEY}&classification=Sculpture&page=",
    "https://api.harvardartmuseums.org/object?apikey=#{KEY}&classification=Paintings&page=",
    "https://api.harvardartmuseums.org/object?apikey=#{KEY}&classification=Jewelry&page=",
    "https://api.harvardartmuseums.org/object?apikey=#{KEY}&classification=Photographs&page=",
    "https://api.harvardartmuseums.org/object?apikey=#{KEY}&classification=Tablets&page=",
    "https://api.harvardartmuseums.org/object?apikey=#{KEY}&classification=Coins&page=",
    "https://api.harvardartmuseums.org/object?apikey=#{KEY}&classification=Stained%20Glass&page=",
    "https://api.harvardartmuseums.org/object?apikey=#{KEY}&classification=Mosaics&page="]  


# TIERS = {
#     "Architectural Elements" => Faker::Commerce.price(range: 10000..10000000),
#     "Drawings" => Faker::Commerce.price(range: 10000..5000000),
#     "Sculpture" => Faker::Commerce.price(range: 10000..10000000),
#     "Paintings" => Faker::Commerce.price(range: 5000000..10000000),
#     "Jewelry" => Faker::Commerce.price(range: 10000..1000000),
#     "Photographs" => Faker::Commerce.price(range: 10000..10000000),
#     "Tablets" => Faker::Commerce.price(range: 100000..7000000),
#     "Coins" => Faker::Commerce.price(range: 10000..3000000),
#     "Stained Glass" => Faker::Commerce.price(range: 10000..5000000),
#     "Mosaics" => Faker::Commerce.price(range: 10000..5000000)
# }


# (1..100).each do |i|
#     url = "https://api.harvardartmuseums.org/object?apikey=#{KEY}&classification=Sculpture&page=#{i}"
 def create_art(url)
    art = RestClient.get(url)
    art_array = JSON.parse(art)['records']
    art_array.each do |art|
        if art['primaryimageurl']
            if art['imagecount'] > 1 
                image_arr = []
                art['images'].each do |image|
                    image_arr << image['baseimageurl']
                end
                image_urls = image_arr.join(', ')
            else
                image_urls = nil
            end
            category = Category.find_or_create_by(name: art['classification'])
            artifact = Artifact.find_or_create_by(list_price: Faker::Commerce.price(range: 10000..10000000), 
            sold: false, title: art['title'], 
            category_id: category.id, 
            technique: art['technique'], 
            dated: art['dated'], 
            primary_image: art['primaryimageurl'], 
            provenance: art['provenance'], 
            description: art['description'],
            dimensions: art['dimensions'],
            medium: art['medium'],
            century: art['century'],
            accession_year: art['accessionyear'],
            accession_method: art['accessionmethod'],
            culture: art['culture'],
            verification: art['verificationleveldescription'], 
            images: image_urls)
        end
    end
end


urls.each do |url|
    (1..2).each do |i| 
        api_url = url+i.to_s
        create_art(api_url)
    end
end


# c1 = Category.create(name: 'Greek')
# c2 = Category.create(name: 'Roman')
# art1 = Artifact.create(title: 'Sculpture', category_id: c1.id)
# art2 = Artifact.create(title: 'Painting', category_id: c2.id)
# art3 = Artifact.create(title: 'Glass', category_id: c1.id)
u1 = User.create(first_name: "Abhinav", last_name: 'Sharma', username: 'as', address: '123 Lane', admin: false, password: '123')
u2 = User.create(first_name: "Saima", last_name: 'Akhtar', username: 'sa', address: '456 Lane', admin: true, password: '123')
# o1 = Order.create(user_id: u1.id, artifact_id: art1.id)
# o2 = Order.create(user_id: u2.id, artifact_id: art2.id)
# o3 = Order.create(user_id: u1.id, artifact_id: art3.id)
# o4 = Order.create(user_id: u2.id, artifact_id: art3.id)

