class AppreciationSerializer
  include JSONAPI::Serializer
  attributes :id, :notes, :appreciation, :nom, :cours
end
