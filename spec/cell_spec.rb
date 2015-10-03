require './lib/conway'

RSpec.describe Conway::Cell do
  describe '#alive?' do
    context 'the cell is alive' do
      it 'should return true' do
        expect(Conway::Cell.new.alive?).to be(false)
      end
    end
  end

  describe '#current_state' do
    context 'the cell is alive' do
      it 'should return :alive' do
        cell = Conway::Cell.new(alive:true)
        expect(cell.current_state).to eq(:alive)
      end
    end

    context 'the cell is dead' do
      it 'should return :dead' do
        cell = Conway::Cell.new(alive:false)
        expect(cell.current_state).to eq(:dead)
      end
    end
  end
end