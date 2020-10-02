class Player
    attr_accessor :name, :tag, :score
    def initialize(name)
        @name = name
        @score = []
    end
end