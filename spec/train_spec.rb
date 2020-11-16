require 'spec_helper'
require_relative '../src/train'
require_relative '../src/route'
require_relative '../src/station'

describe Train do

  let!(:starting_station) { Station.new('Kazakhstan') }
  let!(:end_station) { Station.new('USA') }
  let!(:intermediate_station_1) { Station.new('Russia') }
  let!(:intermediate_station_2) { Station.new('East Europe') }
  let!(:intermediate_station_3) { Station.new('West Europe') }
  
  let!(:route) { Route.new(starting_station, end_station) }

  subject { described_class.new('1') }
 
  describe '#current_station' do

    context 'When it does not have route' do
      it 'returns nil' do
        expect(subject.current_station).to eq(nil)
      end
    end

    context 'When it has route' do
      it 'returns current station' do
        subject.take_route(route)
        expect(subject.current_station).to eq(route.starting_station)
      end
    end
  end

  describe '#next_station' do
    it 'returns trains next station' do
      route.add_intermediate_station(intermediate_station_1)
      subject.take_route(route)
      expect(subject.next_station).to eq(intermediate_station_1)
    end
  end

  describe '#previous_station' do
    it 'returns trains previous station' do
      route.add_intermediate_station(intermediate_station_1)
      subject.take_route(route)
      expect(subject.previous_station).to eq(nil)
    end
  end

  describe '#move_forward' do
    it 'it moves to the next station and returns it as current' do
      route.add_intermediate_station(intermediate_station_1)
      subject.take_route(route)
      expect(subject.move_forward).to eq(intermediate_station_1)
      expect(subject.current_station).to eq(intermediate_station_1)
    end
  end

  describe '#move_backward' do
    it 'it moves to the previous station and returns it as current' do
      route.add_intermediate_station(intermediate_station_1)
      subject.take_route(route)
      subject.move_forward
      expect(subject.move_backward).to eq(starting_station)
      expect(subject.current_station).to eq(starting_station)
    end
  end
end