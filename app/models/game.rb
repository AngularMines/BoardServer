class Game

  attr_reader :size, :board

  def initialize(size=10, board = Array.new(size) { Array.new(size) {Cell.new}} )
    @size = size
    @board = board
    @directions = [[-1,-1],[-1,0],[-1,1],[0,1],[1,1],[1,0],[1,-1],[0,-1]]
    # total_mines
    @lose = false
    @start_time = Time.now
    @win = false
  end

  def total_mines
    count = 0
    @board.each{|row| count += row.count{|cell| cell.mine}}
    count
 end

  def count_neighbour_mines(r,c)
    @board[r][c].neighbour_mines = 0

    @directions.each {|i,j| @board[r][c].neighbour_mines += 1 if mine?(r+i,c+j) && in_bounds?(r+i,c+j) }

    @board[r][c].neighbour_mines
  end

  def mine?(r,c)
    @board[r][c].mine
  end

  def in_bounds?(r,c)
    r.between?(0,@size-1) && c.between?(0,@size-1)
  end

  def return_value(r,c)
    if mine?(r,c)
      @lose = true
    else
      @board[r][c].known = true
      if check_for_win
        game_over
      else
        @board[r][c].neighbour_mines
      end
    end
  end

  def check_for_win
    @board.each_with_index {|row, r| row.each_with_index {|col, c| @win = true if mine?(r,c) || @board[r][c].known }}
    won?
  end

  def finish_time
    (Time.now - @start_time).floor.to_s
  end

  def won?
    @win
  end

  def game_over

  end

end
