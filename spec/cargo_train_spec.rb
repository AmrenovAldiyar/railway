require 'spec_helper'
require_relative '../src/classes/cargo_train'
require_relative '../src/classes/cargo_wagon'
require_relative '../src/classes/passenger_wagon'

describe CargoTrain do
  subject { CargoTrain.new('1') }
  let!(:cargo_wagon) { CargoWagon.new }
  let!(:passenger_wagon) { PassengerWagon.new }
  describe '#hook_wagon' do
    context 'when wagon is passenger' do
      it 'not hooks it' do
        expect(subject.hook_wagon(passenger_wagon)).to eq(nil)
      end
    end

    context 'when wagon is cargo' do
      it 'hooks it' do
        expect(subject.hook_wagon(cargo_wagon)).to eq([cargo_wagon])
      end
    end
  end
end