# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
months = ['Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
times = ['12:00pm','1:00pm', '2:00pm', '3:00pm', '4:00pm', '5:00pm', '12:30pm','1:30pm', '2:30pm', '3:30pm', '4:30pm', '5:30pm']

5.times do
  doctor = Doctor.create(
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber
  )
  10.times do
    patient = Patient.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      age: Faker::Number,
      phone_number: Faker::PhoneNumber
    )
    Appointment.create(
      month: months.sample,
      day: days.sample,
      year: 2020,
      time: times.sample,
      office_name: Faker::Nation
    )
  end
end

    puts "Data Seeded."

