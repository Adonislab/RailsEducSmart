class ReclamationSerializer
  include JSONAPI::Serializer
   attributes :id, :object, :description, :nom, :cours
end
