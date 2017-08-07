require 'rails_helper'

describe Song::Index do
  let!(:song) { create(:song) }

  subject do
    Song::Index.call
  end

  describe 'persistence' do
    it "should fetch a page of songs" do
      expect(subject['model']).to eq([song])
    end

    context "when name param is passed" do
      it "should return the songs searched by name" do
      end
    end
  end
end
