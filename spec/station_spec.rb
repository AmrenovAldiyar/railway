require 'spec_helper'
require_relative '../src/station'
require_relative '../src/train'

describe Station do
  subject { described_class.new('Heaven') }
  
  let!(:passenger_train) { Train.new('1') }
  let!(:cargo_train) { Train.new('1') }

  before(:each) do
    subject.take_train(passenger_train)
    subject.take_train(cargo_train)
  end

  describe '#send_train' do
    it 'removes train from trains list' do
      expect(subject.trains.size).to eq(2)
      subject.send_train(passenger_train)
      expect(subject.trains.size).to eq(1)
    end
  end
end
