require 'spec_helper'
require_relative '../../second.rb'
require_relative '../../symmetry_engine.rb'
require_relative '../../symmetry.rb'

describe 'Symmetry' do
  it { expect(Symmetry.new).to respond_to(:off_col)}
end