# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'


User.destroy_all
School.destroy_all
Student.destroy_all
Session.destroy_all


#cantidad de datos por tabla
num_users = 19 #( +1 demouser)
num_schools = (num_users + 1)*3
num_students = 1000
num_sessions = 200



#Alterar secuencias (evitar llave duplicada) (Para producción):

# ActiveRecord::Base.connection.execute("ALTER SEQUENCE users_id_seq RESTART WITH #{num_users + 1}")
# ActiveRecord::Base.connection.execute("ALTER SEQUENCE schools_id_seq RESTART WITH #{num_schools + 1}")
# ActiveRecord::Base.connection.execute("ALTER SEQUENCE students_id_seq RESTART WITH #{num_students + 1}")
# ActiveRecord::Base.connection.execute("ALTER SEQUENCE sessions_id_seq RESTART WITH #{num_sessions  + 1}")


#User1:
user = User.new
user.id = 1
user.email = 'demouser@gmail.com'
user.first_name = 'Demo'
user.last_name_1 = 'user'
user.password = 'demouser123'
user.password_confirmation = 'demouser123'
user.save!

#Users:
_rdm_genre = Random.new
_rdm_middle_name = Random.new
_rdm_last_name2 = Random.new
num_users.times do |i|
	rdm_genre = _rdm_genre.rand(0..1)
	rdm_middle_name = _rdm_middle_name.rand(0..1)
	rdm_last_name2 = _rdm_last_name2.rand(0..1)


	user = User.new
	user.email = Faker::Internet.email
	user.password = 'demouser123'
	user.password_confirmation = 'demouser123'
	user.last_name_1 = Faker::Name.last_name

	if rdm_genre == 0 && rdm_last_name2 == 0 && rdm_middle_name == 0
		user.first_name = Faker::Name.female_first_name
		
	elsif rdm_genre == 0 && rdm_last_name2 == 0 && rdm_middle_name == 1
		user.first_name = Faker::Name.female_first_name
		user.middle_name = Faker::Name.female_first_name

	elsif rdm_genre == 0 && rdm_last_name2 == 1 && rdm_middle_name == 0
		user.first_name = Faker::Name.female_first_name
		user.last_name_2 = Faker::Name.last_name

	elsif rdm_genre == 0 && rdm_last_name2 == 1 && rdm_middle_name == 1
		user.first_name = Faker::Name.female_first_name
		user.middle_name = Faker::Name.female_first_name
		user.last_name_2 = Faker::Name.last_name

	elsif rdm_genre == 1 && rdm_last_name2 == 0 && rdm_middle_name == 0
		user.first_name = Faker::Name.male_first_name

	elsif rdm_genre == 1 && rdm_last_name2 == 0 && rdm_middle_name == 1
		user.first_name = Faker::Name.male_first_name
		user.middle_name = Faker::Name.male_first_name

	elsif rdm_genre == 1 && rdm_last_name2 == 1 && rdm_middle_name == 0
		user.first_name = Faker::Name.male_first_name
		user.last_name_2 = Faker::Name.last_name

	elsif rdm_genre == 1 && rdm_last_name2 == 1 && rdm_middle_name == 1
		user.first_name = Faker::Name.male_first_name
		user.middle_name = Faker::Name.male_first_name
		user.last_name_2 = Faker::Name.last_name
	end
	user.save!
	
end

#Schools:
rdm_user = Random.new
num_schools.times do |i|
	school= School.new(
		id: i+1,
		code: "SEC-#{i+1}",
		user_id: rdm_user.rand(1..num_users)
		);
	if i.odd?
		school.name = Faker::Educator.unique.secondary_school
	else
		school.name = Faker::University.unique.name
	end
	school.save
end


#Students:
rdm_user = Random.new
rdm_school = Random.new
rdm_grade = Random.new
rdm_age = Random.new
_rdm_genre = Random.new
_rdm_middle_name = Random.new
_rdm_last_name2 = Random.new

num_students.times do |i|
	rdm_genre = _rdm_genre.rand(0..1)
	rdm_middle_name = _rdm_middle_name.rand(0..1)
	rdm_last_name2 = _rdm_last_name2.rand(0..1)

	student = Student.new
	student.last_name_1 = Faker::Name.last_name
	student.cc = Faker::Number.number(10)
	student.grade = rdm_grade.rand(3..11)
	student.age = rdm_age.rand(8..18)
	student.user_id = rdm_user.rand(1..num_users)
	student.school_id = rdm_school.rand(1..num_schools)


	if rdm_genre == 0 && rdm_last_name2 == 0 && rdm_middle_name == 0
		student.gender = "Femenino"
		student.first_name = Faker::Name.female_first_name
		
	elsif rdm_genre == 0 && rdm_last_name2 == 0 && rdm_middle_name == 1
		student.gender = "Femenino"
		student.first_name = Faker::Name.female_first_name
		student.middle_name = Faker::Name.female_first_name

	elsif rdm_genre == 0 && rdm_last_name2 == 1 && rdm_middle_name == 0
		student.gender = "Femenino"
		student.first_name = Faker::Name.female_first_name
		student.last_name_2 = Faker::Name.last_name

	elsif rdm_genre == 0 && rdm_last_name2 == 1 && rdm_middle_name == 1
		student.gender = "Femenino"
		student.first_name = Faker::Name.female_first_name
		student.middle_name = Faker::Name.female_first_name
		student.last_name_2 = Faker::Name.last_name

	elsif rdm_genre == 1 && rdm_last_name2 == 0 && rdm_middle_name == 0
		student.gender = "Masculino"
		student.first_name = Faker::Name.male_first_name

	elsif rdm_genre == 1 && rdm_last_name2 == 0 && rdm_middle_name == 1
		student.gender = "Masculino"
		student.first_name = Faker::Name.male_first_name
		student.middle_name = Faker::Name.male_first_name

	elsif rdm_genre == 1 && rdm_last_name2 == 1 && rdm_middle_name == 0
		student.gender = "Masculino"
		student.first_name = Faker::Name.male_first_name
		student.last_name_2 = Faker::Name.last_name

	elsif rdm_genre == 1 && rdm_last_name2 == 1 && rdm_middle_name == 1
		student.gender = "Masculino"
		student.first_name = Faker::Name.male_first_name
		student.middle_name = Faker::Name.male_first_name
		student.last_name_2 = Faker::Name.last_name
	end
	student.save!
	
end

#Cites:
#Simpsons / Friends:
# prng1 = Random.new
# prng2 = Random.new
# num_cites.times do |i|
# 	rdm= prng1.rand(1..5)

# 	if rdm == 1
# 		Cite.create!(id: i+1,content: Faker::Shakespeare.hamlet_quote, book_id: prng2.rand(1..num_books)  )
# 	elsif rdm == 2
# 		Cite.create!(id: i+1,content: Faker::Shakespeare.as_you_like_it_quote, book_id: prng2.rand(1..num_books)  )
# 	elsif rdm == 3
# 		Cite.create!(id: i+1,content: Faker::Shakespeare.king_richard_iii_quote, book_id: prng2.rand(1..num_books)  )
# 	elsif rdm == 4
# 		Cite.create!(id: i+1,content: Faker::Shakespeare.romeo_and_juliet_quote, book_id: prng2.rand(1..num_books)  )	
# 	else
# 		Cite.create!(id: i+1,content: Faker::StarWars.quote, book_id: prng2.rand(1..num_books)  )

# 	end


# end
