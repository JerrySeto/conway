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

  describe '#next_state' do
    it 'should raise an error if the number of neighbours is less than 0' do
      cell = Conway::Cell.new
      expect {cell.next_state(-1)}.to raise_error('invalid number of neighbours')
    end
    context 'the cell is alive' do
      let(:cell) {Conway::Cell.new(alive:true)}
      it 'should return :dead if it has less than 2 neighbours' do
        expect(cell.next_state(1)).to eq(:dead)
        expect(cell.next_state(0)).to eq(:dead)
      end

      it 'should return :alive if it has exactly 2 or three neighbours' do
        expect(cell.next_state(2)).to eq(:alive)
        expect(cell.next_state(3)).to eq(:alive)
      end

      it 'should return :dead if it has more than 3 neighbours' do
        expect(cell.next_state(4)).to eq(:dead)
      end
    end

    context 'the cell is dead' do
      let(:cell) {Conway::Cell.new}
      it 'should return :alive if it has exactly three neighbours' do
        expect(cell.next_state(3)).to eq(:alive)
      end

      it 'should return :dead if it does not have exactly three neighbours' do
        expect(cell.next_state(2)).to eq(:dead)
      end
    end
  end
end