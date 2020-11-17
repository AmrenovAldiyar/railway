require 'spec_helper'
require_relative '../src/modules/manufacturerable'

class SomeClass
end

describe Manufacturerable do
  it 'adds manufacturer getter and setter methods to class' do
    train = SomeClass.new
    expect(train.methods.include?(:manufacturer=)).to eq(false)
    train.extend(Manufacturerable)
    expect(train.methods.include?(:manufacturer=)).to eq(true)
  end
end