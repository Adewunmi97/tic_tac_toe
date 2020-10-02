class Player
    attr_accessor :name, :tag, :score
    def initialize(name, tag)
        @name = name
        @tag = tag
        @score = []
    end
end