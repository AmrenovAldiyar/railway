require "spec_helper"
require_relative "../src/station"
require_relative "../src/train"

describe Station do
  subject { described_class.new('Heaven') }
  
  let!(:passenger_train) { Train.new('1', type: 'passenger', wagons_quantity: 10) }
  let!(:cargo_train) { Train.new('1', type: 'cargo', wagons_quantity: 5) }

  before(:each) do
    subject.take_train(passenger_train)
    subject.take_train(cargo_train)
  end

  describe '#send_train' do
    it "removes train from trains list" do
      expect(subject.trains.size).to eq(2)
      subject.send_train(passenger_train)
      expect(subject.trains.size).to eq(1)
    end
  end

  describe '#trains_by_type' do
    context "when requiering type is passenger" do
      it "returns an array of only passenger trains" do
        expect(subject.trains_by_type('passenger')).to eq([
          passenger_train
        ])
      end
    end
    context "when requiering type is cargo" do
      it "returns an array of only cargo trains" do
        expect(subject.trains_by_type('cargo')).to eq([
          cargo_train
        ])
      end
    end
  end
end
