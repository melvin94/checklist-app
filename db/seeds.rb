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
    description: "Compatible Tech Support",
    basic: true,
    admin: true,
    super_admin: true,
  },

  {
    description: "Compatible User",
    basic: true,
    admin: true,
    super_admin: false,
  },

  {
    description: "Client User",
    basic: true,
    admin: false,
    super_admin: false,
  },
]

roles.each do |role|
  Role.create!(
    description: role[:description],
    basic: role[:basic],
    admin: role[:admin],
    super_admin: role[:super_admin],
  )
end

compatible_super_admin_user = User.create!(
  name: "Compatible Tech Support",
  registration_number: Faker::Company.unique.south_african_pty_ltd_registration_number,
  address: Faker::Address.unique.full_address,
  phone_number: Faker::PhoneNumber.unique.phone_number_with_country_code,
  email: "tech_support@compatible.com",
  password: "123456",
  password_confirmation: "123456",
  role_id: 1,
)

compatible_admin_user = User.create!(
  name: "Compatible Sales Team",
  registration_number: Faker::Company.unique.south_african_pty_ltd_registration_number,
  address: Faker::Address.unique.full_address,
  phone_number: Faker::PhoneNumber.unique.phone_number_with_country_code,
  email: "sales@compatible.com",
  password: "123456",
  password_confirmation: "123456",
  role_id: 2,
)

example_client_user = User.create!(
  name: "Tokara Winefarm",
  registration_number: Faker::Company.unique.south_african_pty_ltd_registration_number,
  address: Faker::Address.unique.full_address,
  phone_number: Faker::PhoneNumber.unique.phone_number_with_country_code,
  email: "tokara@example.com",
  password: "123456",
  password_confirmation: "123456",
  role_id: 3,
)

5.times do
  User.create!(
    name: Faker::Company.unique.name,
    registration_number: Faker::Company.unique.south_african_pty_ltd_registration_number,
    address: Faker::Address.unique.full_address,
    phone_number: Faker::PhoneNumber.unique.phone_number_with_country_code,
    email: Faker::Internet.unique.safe_email,
    password: "123456",
    password_confirmation: "123456",
    role_id: 3,
  )
end

work_categories = ["Part-time Job", "Once-off Event", "Full-time Experience"]
review_statuses = ["Pending review", "In review", "Approved - posted", "Not approved - pending review"]

User.all[2..-1].each do |user|
  work_categories.each do |work_category|
    review_statuses.each do |review_status|
      Job.create!(
        title: Faker::Job.unique.title,
        category: work_category,
        description: Faker::Lorem.unique.sentence,
        location: Faker::Address.unique.full_address,
        number_of_candidates: Faker::Number.within(range: 1..10),
        employment_date: Faker::Date.between(from: 6.weeks.from_now, to: 6.months.from_now),
        application_cut_off_date: Faker::Date.between(from: 2.weeks.from_now, to: 4.weeks.from_now),
        status: review_status,
        daily_rate: Faker::Number.decimal(l_digits: 2),
        requirements: Faker::Educator.degree,
        owner: user.id,
      )
    end
  end
end
