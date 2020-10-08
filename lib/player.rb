class Player
  attr_accessor :name, :score, :tag
  def initialize(name, tag)
    @name = name
    @tag = tag
    @score = []
  end
end
