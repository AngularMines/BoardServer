class Game

  attr_reader :size, :board

  def initialize(size = 10)
    @size = size
    @board = Array.new(size) { Array.new(size) {Cell.new}}
    @directions = [[-1,-1],[-1,0],[-1,1],[0,1],[1,1],[1,0],[1,-1],[0,-1]]
  end


   def total_mines
    @board.each_with_index {|row, r| row.each_with_index {|col, c| count_neighbour_mines(r,c) }}
   end


  def count_neighbour_mines(r,c)
    unless @board[r][c].mine
      @directions.each {|i,j| @board[r][c].neighbour_mines += 1 if @board[r + i][c + j].mine? && in_bounds?(r+i,c+j) }
    end
  end

  def mine?(r,c)
    @board[r][c].mine
  end

  def in_bounds?(r,c)
    r.between?(0,@size-1) && c.between?(0,@size-1)
  end

end
