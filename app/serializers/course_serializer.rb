class CourseSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :start_date, :end_date
end
