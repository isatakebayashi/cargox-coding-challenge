require 'mongoid'

class MarsSurface
  include Mongoid::Document
  field :top_x, :type => Integer
  field :top_y, :type => Integer
  field :robots, :type=> Array
end
