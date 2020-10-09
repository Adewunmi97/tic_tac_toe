class Player
  attr_accessor :name, :tag
  attr_writer :score
  def initialize(name, tag)
    @name = name
    @tag = tag
    @score = []
  end
end
