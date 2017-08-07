require 'rails_helper'

describe Playlist::Index do
  let!(:playlist) { create(:playlist) }

  subject do
    Playlist::Index.call
  end

  describe 'persistence' do
    it "should fetch all the playlist" do
      expect(subject['model']).to eq([playlist])
    end
  end
end
