# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
User.destroy_all
Order.destroy_all
Artifact.destroy_all

c1 = Category.create(name: 'Greek')
c2 = Category.create(name: 'Roman')
art1 = Artifact.create(title: 'Sculpture', category_id: c1.id)
art2 = Artifact.create(title: 'Painting', category_id: c2.id)
art3 = Artifact.create(title: 'Glass', category_id: c1.id)
u1 = User.create(first_name: "Abhinav", last_name: 'Sharma', username: 'AS', address: '123 Lane', admin: false, password: '123')
u2 = User.create(first_name: "Saima", last_name: 'Akhtar', username: 'SA', address: '456 Lane', admin: false, password: '123')
o1 = Order.create(user_id: u1.id, artifact_id: art1.id)
o2 = Order.create(user_id: u2.id, artifact_id: art2.id)
o3 = Order.create(user_id: u1.id, artifact_id: art3.id)
o4 = Order.create(user_id: u2.id, artifact_id: art3.id)

