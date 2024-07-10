class Course < ApplicationRecord
  belongs_to :category
  has_many :evaluations
  has_many :course_details
  has_many :plannings
end
