require './lib/conway'

RSpec.describe Conway::Cell do
  describe '#alive?' do
    context 'the cell is alive' do
      it 'should return true' do
        expect(Conway::Cell.new.alive?).to be(false)
      end
    end
  end
end