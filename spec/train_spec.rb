require 'spec_helper'
require_relative '../src/classes/train'
require_relative '../src/classes/route'
require_relative '../src/classes/station'

describe Train do
  describe '.all' do
    context 'when there are no trains' do
      it 'returns empty array' do
        expect(described_class.all).to eq([])
      end
    end
    context 'when there are any train' do
      it 'returns array of existing trains' do
        train = described_class.new('1')
        expect(described_class.all).to eq([train])
      end
    end
  end

  describe '.find' do
    context 'when there is no train with such number' do
      it 'returns nil' do
        train = described_class.new('1')
        expect(described_class.find('2')).to eq(nil)
      end
    end
    context 'when there is a train with such number' do
      it 'returns the trains' do
        train = described_class.new('1')
        expect(described_class.find('1')).to eq(train)
      end
    end
  end
 
  # describe '#current_station' do
  #   context 'When it does not have route' do
  #     it 'returns nil' do
  #       expect(subject.current_station).to eq(nil)
  #     end
  #   end

  #   context 'When it has route' do
  #     it 'returns current station' do
  #       subject { described_class.new('123') }
  #       starting_station { Station.new('Kazakhstan') }
  #       end_station { Station.new('USA') }
  #       route { Route.new(starting_station, end_station) }
  #       subject.take_route(route)
  #       expect(subject.current_station).to eq(route.starting_station)
  #     end
  #   end
  # end

  # describe '#next_station' do
  #   it 'returns trains next station' do
  #     route.add_intermediate_station(intermediate_station_1)
  #     subject.take_route(route)
  #     expect(subject.next_station).to eq(intermediate_station_1)
  #   end
  # end

  # describe '#previous_station' do
  #   it 'returns trains previous station' do
  #     route.add_intermediate_station(intermediate_station_1)
  #     subject.take_route(route)
  #     expect(subject.previous_station).to eq(nil)
  #   end
  # end

  # describe '#move_forward' do
  #   it 'it moves to the next station and returns it as current' do
  #     route.add_intermediate_station(intermediate_station_1)
  #     subject.take_route(route)
  #     expect(subject.move_forward).to eq(intermediate_station_1)
  #     expect(subject.current_station).to eq(intermediate_station_1)
  #   end
  # end

  # describe '#move_backward' do
  #   it 'it moves to the previous station and returns it as current' do
  #     route.add_intermediate_station(intermediate_station_1)
  #     subject.take_route(route)
  #     subject.move_forward
  #     expect(subject.move_backward).to eq(starting_station)
  #     expect(subject.current_station).to eq(starting_station)
  #   end
  # end
end