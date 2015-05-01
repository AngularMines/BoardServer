get '/new_game' do
  Game.delete_all
  Game.create(click_count: 0)
  status 200
end


post '/check' do
  r = params[:coords[:row]]
  c = params[:coords[:column]]

  game = Game.all.first

  num = Board.number_at_guess(r,c)

  if(num == -1)
    #send game over
    return -1
  else
    game.click_count += 1
    game.save
  end

  #game win?
  if game.click_count == (Board::NUM_EMPTY)
    # work out game time and post to server
    #send game has won
    9
  else
    #return the number at that location
    num
  end

end


