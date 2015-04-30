class Game

  attr_reader :size, :board

  def initialize(size = 10)
    @size = size
    @board = Array.new(size) { Array.new(size) {Cell.new}}
    @directions = [[-1,-1],[-1,0],[-1,1],[0,1],[1,1],[1,0],[1,-1],[0,-1]]
  end

  def find_neighbours
    @board.each_with_index
  end

  def mine?(r,c)
    @board[r][c].mine
  end


end
