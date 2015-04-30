require_relative './spec_helper'
require_relative '../app/models/game'

describe 'Game' do

  def newBoard (size)
    Array.new(size) { Array.new(size) {Cell.new(yield)}}
  end

  before do

    srand(10)
    @size  = 10
    @board = newBoard(@size){rand < 0.1}
    @g = Game.new(@size, @board)
  end



  describe "#mine?" do
    before do
      @all_mines_board = newBoard(@size) {true}
      @no_mines_board = newBoard(@size) {false}
    end

    it "returns true when there is a mine at that location" do
      expect(Game.new(@size,@all_mines_board).mine?(0,0)).to eq(true)
    end
    it "returns false when there is not a mine at that location" do
      expect(Game.new(@size,@no_mines_board).mine?(0,0)).to eq(false)
    end

  end

  describe "#in_bounds?" do

    it "should return false when out of bounds" do
      expect(@g.in_bounds?(-1, 0)).to eq(false)
      expect(@g.in_bounds?(0, -1)).to eq(false)
      expect(@g.in_bounds?(@size, 0)).to eq(false)
      expect(@g.in_bounds?(0, @size)).to eq(false)
    end

    it "should return true when in bounds" do
      expect(@g.in_bounds?(1,1)).to eq(true)
    end

  end




end
