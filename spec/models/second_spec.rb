require 'spec_helper'
require_relative '../../second.rb'

describe 'Second' do
  context 'is initialized without a parameter' do
    before do
      @second = Second.new
    end
    it { expect(@second.seed).to_not be_nil}
  end
  context 'is initialized with a parameter' do
    before do
      @seed = 82000
      @second = Second.new @seed
    end
    it { expect(@second.seed).to be_eql(@seed)}
  end
  context 'is correctly represented in matrix form' do
    before do
      @matrix = Second.new.to_matrix
    end
    it { expect(@matrix.row_size()).to be_eql(4)}
    it { (0..5).each do |i|
      expect(@matrix.row(i).size).to be_eql(6)
    end }
  end
end