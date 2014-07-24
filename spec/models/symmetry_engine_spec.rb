require 'spec_helper'
require_relative '../../second.rb'
require_relative '../../symmetry_engine.rb'

describe 'SymmetryEngine' do
  context 'determines symmetry' do
    context 'off col 1' do
      context 'with valid data' do
        before do
          @second = Second.initialize_from_hms(1,10,0)
        end
        it { expect(SymmetryEngine.symmetry?(@second.to_matrix)).to be_true }
      end
      context 'with invalid data' do
        before do
          @second = Second.initialize_from_hms(1,10,2)
        end
        it { expect(SymmetryEngine.symmetry?(@second.to_matrix)).to be_false }
      end
    end
    context 'off col 2' do
      context 'with valid data' do
        before do
          @second = Second.initialize_from_hms(01,10,00)
        end
        it { expect(SymmetryEngine.symmetry?(@second.to_matrix)).to be_true }
      end
      context 'with invalid data' do
        before do
          @second = Second.initialize_from_hms(1,10,2)
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
        before do
          @second = Second.initialize_from_hms(12,15,11)
        end
        it { expect(SymmetryEngine.symmetry?(@second.to_matrix)).to be_false }
      end
    end
  end
end