

class Board

  BOARD = [
    [0,1,-1,1,0,0,0,0,1,-1],
    [0,1,1,1,0,0,0,0,1],
    [1,1,1,0,1,1,1,0,0,0],
    [1,-1,1,0,2,-1,3,1,1,0],
    [1,1,1,0,3,-1,4,-1,1,1],
    [0,0,0,0,2,-1,3,2,-1,1],
    [1,1,1,0,1,1,1,1,1,0],
    [1,-1,2,1,0,1,1,1,0,0],
    [1,3,-1,2,0,2,-1,2,0,0],
    [0,1,-1,2,0,2,-1,2,0,0]
  ]


  NUM_MINES = 13
  NUM_EMPTY = 87

  def self.number_at_guess(r,c)
    BOARD[r][c]
  end
end
