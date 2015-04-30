class Cell

  attr_accessor :mine, :neighbour_mines

  def initialize
    @mine = [true, false, false, false].sample
    @neighbour_mines = 0
  end

end
