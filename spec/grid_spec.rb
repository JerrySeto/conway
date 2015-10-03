require './lib/conway/grid'
require 'pry'
RSpec.describe Conway::Grid do
  describe '#set_alive' do
    it 'should set the cell at the given position to be alive' do
      grid = Conway::Grid.new(width: 1, height: 1)
      grid.set_alive(0, 0)
      expect(grid.alive?(0, 0)).to be
    end
  end

  describe '#alive?' do
    context 'the cell at the given position is dead' do
      it 'should return false' do
        grid = Conway::Grid.new(width:1, height: 1)
        grid.alive?(0,0)
        expect(grid.alive?(0,0)).to be(false)
      end
    end
  end

  describe '#set_dead' do
    it 'should set the cell at the give position to be dead' do
      grid = Conway::Grid.new(width: 1, height: 1)
      grid.set_dead(0, 0)
      expect(grid.alive?(0, 0)).to be(false)
    end
  end

  describe '#living_neighbours' do
    it 'should return the number of living cells that neighbour the given position' do
      grid = Conway::Grid.new(width: 3, height: 3)
      grid.set_alive(0, 0)
      grid.set_alive(1, 0)
      grid.set_alive(2, 0)
      grid.set_alive(0, 1)
      grid.set_alive(2, 1)
      grid.set_alive(0, 2)
      grid.set_alive(1, 2)
      grid.set_alive(2, 2)
      expect(grid.living_neighbours(1, 1)).to eq(8)
    end

    it 'should return the correct number of cells when on an edge' do
      grid = Conway::Grid.new(width: 1, height: 1)
      expect(grid.living_neighbours(0 ,0)).to eq(0)
    end
  end
end