# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "start seed"
c1 = Student.create(name: "MC", age: 25, level: "beginner")
c2 = Student.create(name: "Jordan", age: 25, level: "advanced")

i1 = Instructor.create(name: "Joe", experience: 10, rate: 75, img: "url")
i2 = Instructor.create(name: "Jill", experience: 8, rate: 50, img: "url")

m1 = Mountain.create(name: "Killington", location: "Vermont", trails: 14, lifts: 7)
m1 = Mountain.create(name: "Aspen Snowmass", location: "Aspen", trails: 18, lifts: 9)

mi1 = MountainInstructor.create(mountain_id: 1, instructor_id: 1)
mi2 = MountainInstructor.create(mountain_id: 1, instructor_id: 2)
mi3 = MountainInstructor.create(mountain_id: 2, instructor_id: 1)
mi4 = MountainInstructor.create(mountain_id: 2, instructor_id: 2)
mi5 = MountainInstructor.create(mountain_id: 8, instructor_id: 2)
mi6 = MountainInstructor.create(mountain_id: 8, instructor_id: 1)
mi7 = MountainInstructor.create(mountain_id: 10, instructor_id: 1)

r1 = Review.create(instructor_id: 1, student_id: 1, rating: 5, description: "great job")
r1 = Review.create(instructor_id: 2, student_id: 1, rating: 4, description: "pretty good job")
r1 = Review.create(instructor_id: 2, student_id: 2, rating: 3, description: "was aight")

b1 = Booking.create(student_id: 1, mountain_instructor_id: 1, duration: 2, book_time: DateTime.new(2018,2,3,4,5))
b2 = Booking.create(student_id: 1, mountain_instructor_id: 2, duration: 1, book_time: DateTime.new(2018,3,3,4,5))
b3 = Booking.create(student_id: 2, mountain_instructor_id: 1, duration: 3, book_time: DateTime.new(2018,4,3,4,5))
b4 = Booking.create(student_id: 2, mountain_instructor_id: 2, duration: 4, book_time: DateTime.new(2019,5,3,4,5))

aspen = Mountain.create(name: "Aspen Snowmass", location: "Aspen, CO", trails: 94, lifts: 21, mt_img:"./images/aspen.jpg", region: "Rocky Mountains, United States" )

vail = Mountain.create(name: "Vail Ski Resort", location: "Vail, CO", trails: 193, lifts: 31, mt_img:"https://instagram.fnyc1-1.fna.fbcdn.net/vp/888e33e948b72168834f6e10fe4257f3/5CF84C64/t51.2885-15/sh0.08/e35/s750x750/47583645_2063763700377983_6431738291832379343_n.jpg?_nc_ht=instagram.fnyc1-1.fna.fbcdn.net", region: "Rocky Mountains, United States" )



puts "end seed"
