require 'spec_helper'
require_relative '../src/classes/route'
require_relative '../src/classes/station'

describe Route do
  # let!(:starting_station) { Station.new('Kazakhstan') }
  # let!(:end_station) { Station.new('USA') }
  # subject { described_class.new(starting_station, end_station) }

  # describe '#stations' do
  #   context 'When there are no intermediate stations' do
  #     it 'returns an array of starting and end stations' do
  #       expect(subject.stations).to eq([starting_station, end_station])
  #     end
  #   end

  #   context 'When there are intermediate stations' do
  #     let!(:intermediate_station_1) { Station.new('Russia') }
  #     let!(:intermediate_station_2) { Station.new('East Europe') }
  #     let!(:intermediate_station_3) { Station.new('West Europe') }
  #     it 'returns an array of starting, intermediate and end stations' do
  #       subject.add_intermediate_station(intermediate_station_1)
  #       subject.add_intermediate_station(intermediate_station_2)
  #       subject.add_intermediate_station(intermediate_station_3)
  #       expect(subject.stations).to eq([
  #         starting_station, 
  #         intermediate_station_1, 
  #         intermediate_station_2, 
  #         intermediate_station_3, 
  #         end_station
  #       ])
  #     end
  #   end
  # end
end