# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

access_titles = [
  "Corporate",
  "Region",
  "Hotel",
  "Department",
]
4.times do |access_level|
  AccessLevel.create!(level: access_level, title: access_titles[access_level])
end

roles = [
  {
    title: "Tech-Support",
    checklist_user: true,
    checklist_manager: true,
    user_manager: true,
    organization_manager: true,
    audit_manager: true,
    audit_user: true,
    primary: true,
    admin: true,
    support: true,
  },

  {
    title: "Internal Checker",
    checklist_user: true,
    checklist_manager: false,
    user_manager: false,
    organization_manager: false,
    audit_manager: false,
    audit_user: false,
    primary: false,
    admin: false,
    support: false,
  },

  {
    title: "Supervisor",
    checklist_user: true,
    checklist_manager: true,
    user_manager: false,
    organization_manager: false,
    audit_manager: false,
    audit_user: false,
    primary: false,
    admin: true,
    support: false,
  },

  {
    title: "General Manager",
    checklist_user: true,
    checklist_manager: true,
    user_manager: true,
    organization_manager: false,
    audit_manager: false,
    audit_user: false,
    primary: false,
    admin: true,
    support: false,
  },

  {
    title: "Manager On Duty",
    checklist_user: true,
    checklist_manager: true,
    user_manager: false,
    organization_manager: false,
    audit_manager: false,
    audit_user: false,
    primary: false,
    admin: true,
    support: false,
  },

  {
    title: "Administrator",
    checklist_user: true,
    checklist_manager: true,
    user_manager: true,
    organization_manager: false,
    audit_manager: false,
    audit_user: false,
    primary: false,
    admin: true,
    support: false,
  },

  {
    title: "External Checker",
    checklist_user: true,
    checklist_manager: false,
    user_manager: false,
    organization_manager: false,
    audit_manager: false,
    audit_user: false,
    primary: false,
    admin: true,
    support: false,
  },

  {
    title: "Regional Specialist",
    checklist_user: true,
    checklist_manager: true,
    user_manager: false,
    organization_manager: false,
    audit_manager: false,
    audit_user: false,
    primary: false,
    admin: true,
    support: false,
  },

  {
    title: "Regional COO",
    checklist_user: true,
    checklist_manager: true,
    user_manager: true,
    organization_manager: false,
    audit_manager: false,
    audit_user: true,
    primary: false,
    admin: true,
    support: false,
  },

  {
    title: "Administrator Corporate",
    checklist_user: true,
    checklist_manager: true,
    user_manager: true,
    organization_manager: true,
    audit_manager: true,
    audit_user: false,
    primary: false,
    admin: true,
    support: false,
  },

  {
    title: "First Administrator Corporate",
    checklist_user: true,
    checklist_manager: true,
    user_manager: true,
    organization_manager: true,
    audit_manager: true,
    audit_user: false,
    primary: true,
    admin: true,
    support: false,
  },

  {
    title: "Corporate Specialist",
    checklist_user: true,
    checklist_manager: true,
    user_manager: false,
    organization_manager: false,
    audit_manager: true,
    audit_user: false,
    primary: false,
    admin: true,
    support: false,
  },

  {
    title: "External Reviewer",
    checklist_user: false,
    checklist_manager: false,
    user_manager: false,
    organization_manager: false,
    audit_manager: false,
    audit_user: false,
    primary: false,
    admin: true,
    support: false,
  },

]

roles.each do |role|
  Role.create!(
    title: role[:title],
    checklist_user: role[:checklist_user],
    checklist_manager: role[:checklist_manager],
    user_manager: role[:user_manager],
    organization_manager: role[:organization_manager],
    audit_manager: role[:audit_manager],
    audit_user: role[:audit_user],
    primary: role[:primary],
    admin: role[:admin],
    support: role[:support],
  )
end

tech_support_user = User.create!(
  first_name: "Tech",
  last_name: "Support",
  email: "shrimp-ops-ts@platform45.com",
  password: "123456",
  password_confirmation: "123456",
  role_id: "1",
  access_level_id: "1",
)

tech_support_user.profile_picture.attach(io: File.open("app/assets/images/tech_support_default.jpg"), filename: "tech_support_default.jpg")

User.create(
  first_name: "Not",
  last_name: "Saskia",
  email: "notsaskia@sakiadoesthings.com",
  password: "123456",
  password_confirmation: "123456",
  role_id: "13",
  access_level_id: "4",
)

AccessLevel.all.each_with_index do |access_level, index2|
  Role.all.each_with_index do |role, index1|
    User.create!(
      first_name: Faker::JapaneseMedia::OnePiece.unique.character.partition(" ").first,
      last_name: Faker::JapaneseMedia::OnePiece.unique.character.partition(" ").first,
      email: Faker::Internet.unique.safe_email,
      password: "123456",
      password_confirmation: "123456",
      role_id: role.id,
      access_level_id: access_level.id,
    )
  end
end

10.times do |index|
  Checklist.create!(
    title: Faker::JapaneseMedia::OnePiece.unique.location,
    description: Faker::JapaneseMedia::OnePiece.unique.quote,
  )
end

Checklist.all.each do |checklist|
  3.times do |index|
    checklist.checklist_items.create!(description: "Do the Step #{index} thing", completed: false, type: "ChecklistItemTask")
    checklist.checklist_items.create!(description: "Is the Step #{index} thing a certain way?", completed: false, type: "ChecklistItemYesOrNo")
    checklist.checklist_items.create!(description: "Rate the Step #{index} thing's thing", completed: false, type: "ChecklistItemRating")
    checklist.checklist_items.create!(description: "Take a picture of Step #{index} thing's thing thing", completed: false, type: "ChecklistItemImage")
  end
end
