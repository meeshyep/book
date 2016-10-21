require_relative 'data_mapper_setup'

class Tag

  include DataMapper::Resource

  property :id, Serial
  property :tag_name, Text, :lazy => false

  has n, :links, :through => Resource

end
