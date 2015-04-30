class Cell

  attr_accessor :mine, :neighbour_mines, :known

  def initialize(mine = ( rand() < 0.1 ) )
    @mine = mine
    @neighbour_mines = 0
    @known = false
  end

end
