require 'rails_helper'

describe Artist::Index do
  let!(:artist) { create(:artist) }

  subject do
    Artist::Index.call
  end

  describe 'persistence' do
    it "should fetch all the artist" do
      expect(subject['model']).to eq([artist])
    end
  end
end
