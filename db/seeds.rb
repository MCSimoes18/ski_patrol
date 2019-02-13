# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "start seed"
c1 = Student.create(name: "MC", age: 25, level: "beginner", username: "mc", password_digest: "mc01")
c2 = Student.create(name: "Jordan", age: 25, level: "advanced", username: "jg", password_digest: "jg01")

i1 = Instructor.create(name: "Joe", experience: 10, rate: 75, img: "url", username: "joe", password_digest: "joe01")
i2 = Instructor.create(name: "Jill", experience: 8, rate: 50, img: "url", username: "jill", password_digest: "jill01")


aspen = Mountain.create(name: "Aspen Snowmass", location: "Aspen, CO", trails: 94, lifts: 21, mt_img: "aspen", region: "Rocky Mountains, United States" )
# vail = Mountain.create(name: "Vail Ski Resort", location: "Vail, CO", trails: 193, lifts: 31, mt_img: "./images/vail.jpg", region: "Rocky Mountains, United States" )
vail = Mountain.create(name: "Vail Ski Resort", location: "Vail, CO", trails: 193, lifts: 31, mt_img:"https://instagram.fnyc1-1.fna.fbcdn.net/vp/888e33e948b72168834f6e10fe4257f3/5CF84C64/t51.2885-15/sh0.08/e35/s750x750/47583645_2063763700377983_6431738291832379343_n.jpg?_nc_ht=instagram.fnyc1-1.fna.fbcdn.net", region: "Rocky Mountains, United States" )
#deleted original mountains

mi1 = MountainInstructor.create(mountain_id: 6, instructor_id: 1)
mi2 = MountainInstructor.create(mountain_id: 6, instructor_id: 2)
mi3 = MountainInstructor.create(mountain_id: 7, instructor_id: 1)

r1 = Review.create(instructor_id: 1, student_id: 1, rating: 5, description: "great job")
r2 = Review.create(instructor_id: 2, student_id: 1, rating: 4, description: "pretty good job")
r3 = Review.create(instructor_id: 2, student_id: 2, rating: 3, description: "was aight")

b1 = Booking.create(student_id: 1, mountain_instructor_id: 1, duration: 2, book_time: DateTime.new(2018,2,3,4,5))
b2 = Booking.create(student_id: 1, mountain_instructor_id: 2, duration: 1, book_time: DateTime.new(2018,3,3,4,5))
b3 = Booking.create(student_id: 2, mountain_instructor_id: 1, duration: 3, book_time: DateTime.new(2018,4,3,4,5))
b4 = Booking.create(student_id: 2, mountain_instructor_id: 2, duration: 4, book_time: DateTime.new(2019,5,3,4,5))

puts "end seed"
