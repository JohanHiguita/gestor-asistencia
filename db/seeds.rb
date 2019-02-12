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
ClassSession.destroy_all


#cantidad de datos por tabla
num_users = 20 #( +1 demouser)
num_schools = (num_users)*3
num_students = 1000
num_sessions = (num_schools)*10 # 10 sessions per School



#Alterar secuencias (evitar llave duplicada) (Para producción):

# ActiveRecord::Base.connection.execute("ALTER SEQUENCE users_id_seq RESTART WITH #{num_users + 1}")
# ActiveRecord::Base.connection.execute("ALTER SEQUENCE schools_id_seq RESTART WITH #{num_schools + 1}")
# ActiveRecord::Base.connection.execute("ALTER SEQUENCE students_id_seq RESTART WITH #{num_students + 1}")
# ActiveRecord::Base.connection.execute("ALTER SEQUENCE sessions_id_seq RESTART WITH #{num_sessions  + 1}")

#Admin
admin = Admin.new
admin.email = "demo-admin@gmail.com"
admin.password = 'demo123'
admin.password_confirmation = 'demo123'
admin.save!

#Users:
_rdm_genre = Random.new
_rdm_middle_name = Random.new
_rdm_last_name2 = Random.new
num_users.times do |i|
	rdm_genre = _rdm_genre.rand(0..1)
	rdm_middle_name = _rdm_middle_name.rand(0..1)
	rdm_last_name2 = _rdm_last_name2.rand(0..1)


	user = User.new
	user.password = 'demo123'
	user.password_confirmation = 'demo123'
	user.cc = Faker::Number.number(10)

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

	#user 1 (Overwrite data)
	if i==0
		user.email = 'demo-user@gmail.com'
		user.first_name = 'Demo'
		user.last_name_1 = 'facilitador'
		user.middle_name = nil
		user.last_name_2 = nil
	else
		user.email = Faker::Internet.email
		user.last_name_1 = Faker::Name.last_name
	end

	user.save!
	
end

#Schools:
rdm_user = Random.new
user_id = 1
num_schools.times do |i|
	school= School.new(
		id: i+1,
		ConsSede: Faker::Number.number(13),
		comuna: Faker::Number.between(1, 16),
		user_id: user_id
		);
	# Avoid no data (because of unique value)
	if i.odd?
		school.name = Faker::Educator.unique.secondary_school
		school.code = "SEC-#{i+1}"
		school.level = "sec"
	else
		school.name = Faker::University.unique.name
		school.code = "PRI-#{i+1}"
		school.level = "pri"
	end

	#each user has 3 schools
	if ( (i+1) % 3 == 0) 
		user_id += 1
	end	
	##puts user_id
	school.save
end


#Students:
#rdm_user = Random.new
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
	student.tel = Faker::Number.between(2000000, 4999999)
	student.observations = Faker::Lorem.paragraph(6)
	student.school_id = rdm_school.rand(1..num_schools)
	student.user_id = (School.find(student.school_id)).user_id #same user tha its school


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

#Sessions:
year=2019
min=0
_rdm_month = Random.new
_rdm_day = Random.new
_rdm_hour = Random.new


school_id = 1
session_number = 1
num_sessions.times do |i|
	rdm_month = _rdm_month.rand(1..3) # ene - mar
	rdm_day = _rdm_day.rand(1..30)
	rdm_hour = _rdm_hour.rand(12..17) # 12pm - 5pm
	session = ClassSession.new
	session.school_id = school_id
	school = School.find(school_id)
	session.user_id = school.user_id # same user
	session.student_ids = school.student_ids # same students
	session.time = Time.utc(year,rdm_month, rdm_day, rdm_hour, min)
	session.number = session_number
	session_number += 1 

	#each school has 10 session (session_number 1 -10)
	if ( (i+1) % 10 == 0) 
		school_id += 1
		session_number = 1
	end	
	
	session.save

end


