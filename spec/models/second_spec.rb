require 'spec_helper'
require_relative '../../models/second.rb'
require_relative '../../models/symmetry_engine.rb'

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
      it { expect(Second.new.to_matrix.zero?).to be_false }
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
  context 'determines symmetry' do
    context 'across middle-most Y axis' do
      context 'with valid data' do
        before do
          @second = Second.initialize_from_hms(1,0,10) # bottom row 010010
        end
        it { expect(SymmetryEngine.symmetry?(@second.to_matrix)).to be_true }
      end
      context 'with invalid data' do
        before do
          @second = Second.initialize_from_hms(1,0,11) # bottom row 010011
        end
        it { expect(SymmetryEngine.symmetry?(@second.to_matrix)).to be_false }
      end
    end
    context 'on col 0' do
      context 'with invalid data' do
        before do
          @second = Second.initialize_from_hms(10,0,0)
        end
        it { expect(SymmetryEngine.symmetry?(@second.to_matrix)).to be_false }
      end
    end
    context 'on col 1' do
      context 'with valid data' do
        before do
          @second = Second.initialize_from_hms(10,10,0)
        end
        it { expect(SymmetryEngine.symmetry?(@second.to_matrix)).to be_true }
      end
      context 'with invalid data' do
        before do
          @second = Second.initialize_from_hms(10,10,11)
        end
        it { expect(SymmetryEngine.symmetry?(@second.to_matrix)).to be_false }
      end
    end
    context 'on col 2' do
      context 'with valid data' do
       before do
         @second = Second.initialize_from_hms(1,11,0)
       end
       it { expect(SymmetryEngine.symmetry?(@second.to_matrix)).to be_true }
      end
      context 'with invalid data' do
        before do
          @second = Second.initialize_from_hms(1,11,2)
        end
        it { expect(SymmetryEngine.symmetry?(@second.to_matrix)).to be_false }
      end
    end
    context 'on col 3' do
      context 'with valid data' do
        before do
          @second = Second.initialize_from_hms(1,11,11)
        end
        it { expect(SymmetryEngine.symmetry?(@second.to_matrix)).to be_true }
      end
      context 'with invalid data' do
        before do
          @second = Second.initialize_from_hms(12,11,11)
        end
        it { expect(SymmetryEngine.symmetry?(@second.to_matrix)).to be_false }
      end
    end
    context 'on col 4' do

      # there is no valid data for col 4 y-axis symmetry - hour is always nonzero

      context 'with invalid data' do

      end
    end
  end
end