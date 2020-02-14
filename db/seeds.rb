# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

support_role = Role.new(title: "Tech-Support", admin: true)
support_role.save!

tech_support_user = User.new(first_name: "Tech", last_name: "Support", email: "shrimp-ops-ts@platform45.com", password: "123456", password_confirmation: "123456", role_id: "1")
tech_support_user.save!
