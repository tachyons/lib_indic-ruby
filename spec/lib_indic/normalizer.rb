require 'spec_helper'

describe LibIndic::Normalizer do
  let(:normalizer) { LibIndic::Normalizer.new }

  context 'Attomic chillu' do
    it 'convert texts with atomic chillu to normal chillu' do
      expect(normalizer.normalize('അവിൽ')).to eq('അവില്‍')
      expect(normalizer.normalize('രമണൻ')).to eq('രമണന്‍')
      expect(normalizer.normalize('അവൾ')).to eq('അവള്‍')
      expect(normalizer.normalize('ശ്രാവൺ')).to eq('ശ്രാവണ്‍')
    end
  end

  context 'Similar characters' do
    xit 'Convert similar charecters to correct form' do
      expect(normalizer.normalize('പൂമ്പാററ')).to eq('പൂമ്പാററ')
    end
  end
end
