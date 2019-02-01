class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :schools, dependent: :nullify
  has_many :students, dependent: :nullify
  has_many :class_sessions, dependent: :nullify
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  def fullName
    "#{self.first_name} #{self.middle_name} #{self.last_name_1} #{self.last_name_2}"
  end

  def students_avg
    sessions = self.class_sessions
    total_students = 0
    sessions.each do |session|
      total_students += session.students.count
    end
    total_sessions = self.class_sessions.count
    (total_students.to_f/ total_sessions).round(1) 

  end
end
