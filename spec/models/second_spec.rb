require 'spec_helper'
require_relative '../../second.rb'
require_relative '../../symmetry_engine.rb'

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
      @seed = 82000
      @second = Second.new @seed
      @matrix = @second.to_matrix
    end
    context 'rows' do
      it { expect(@matrix.row_size()).to be_eql(4)}
    end
    context 'columns' do
      it { (0..3).each { |i| expect(@matrix.row(i).size).to be_eql(6) } }
    end
    context 'has at least one non-zero entry' do
      it { (0..43200).each { |i| expect(Second.new(i).to_matrix.zero?).to be_false } }
    end
    context 'is equivalent to array form' do
      before do
        @matrix_columns = @second.to_matrix.column_vectors
        @array_columns = @second.to_a
      end
      it {
        @array_columns.each_with_index do |col,i|
          col.each_with_index do |bit,j|
            expect(bit).to be_eql(@matrix_columns[i][j])
          end
        end
      }
    end
  end
end