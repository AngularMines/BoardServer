class Cell

  attr_accessor :mine, :neighbour_mines, :known

  def initialize
    @mine = [true, false, false, false].sample
    @neighbour_mines = 0
    @known = false
  end

end
