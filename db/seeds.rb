# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

roles = [
  {
    description: "Compatible",
    basic: true,
    admin: true,
  },

  {
    description: "Client",
    basic: true,
    admin: false,
  },
]

roles.each do |role|
  Role.create!(
    description: role[:description],
    basic: role[:basic],
    admin: role[:admin],
  )
end

compatible_admin_user = User.create!(
  entity_name: "Compatible Team",
  email: "admin@compatible.com",
  password: "123456",
  password_confirmation: "123456",
  role_id: 1,
)

example_client_user = User.create!(
  entity_name: "Tokara Winefarm",
  email: "tokara@example.com",
  password: "123456",
  password_confirmation: "123456",
  role_id: 2,
)

5.times do
  User.create!(
    entity_name: Faker::Company.unique.name,
    email: Faker::Internet.unique.safe_email,
    password: "123456",
    password_confirmation: "123456",
    role_id: 2,
  )
end

User.all.each do |user|
  Job.create!(
    title: Faker::Job.unique.title,
    category: "Part-time Job",
    description: Faker::Company.unique.industry,
    status: "Pending review",
    created_by: user.id,
  )
  Job.create!(
    title: Faker::Job.unique.title,
    category: "Once-off Event",
    description: Faker::Company.unique.industry,
    status: "In review",
    created_by: user.id,
  )
  Job.create!(
    title: Faker::Job.unique.title,
    category: "Full-time Experience",
    description: Faker::Company.unique.industry,
    status: "Approved - posted",
    created_by: user.id,
  )
  Job.create!(
    title: Faker::Job.unique.title,
    category: "Part-time Job",
    description: Faker::Company.unique.industry,
    status: "In review",
    created_by: user.id,
  )
  Job.create!(
    title: Faker::Job.unique.title,
    category: "Once-off Event",
    description: Faker::Company.unique.industry,
    status: "Not approved - pending review",
    created_by: user.id,
  )
  Job.create!(
    title: Faker::Job.unique.title,
    category: "Full-time Experience",
    description: Faker::Company.unique.industry,
    status: "Pending review",
    created_by: user.id,
  )
end
