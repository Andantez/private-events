# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
User.destroy_all
admin = User.create(username: 'ades', email: 'ades@gmail.com',
                    password: 'foobar', password_confirmation: 'foobar')

30.times do
  user = User.create!(username: Faker::Name.male_first_name,
                      email: Faker::Internet.email(name: Faker::Name.male_first_name),
                      password: 'foobar', password_confirmation: 'foobar')

  20.times do
    user.events.create!(description: Faker::Marketing.buzzwords,
                        title: Faker::Book.title,
                        address: Faker::Address.street_address,
                        date: Faker::Time.between(from: 1.year.ago, to: 1.year.from_now))
  end
end
20.times do
  accepted_invitation = [true, false, nil].sample
  User.all.each do |user_invite|
    random_attendee = (1..30).to_a.sample
    random_event = (1..600).to_a.sample
    user_invite.invitations.create!(accepted: accepted_invitation,
                                    attended_event_id: random_event,
                                    attendee_id: random_attendee)
  end
end
