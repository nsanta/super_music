require 'rails_helper'

describe Playlist::Show do
  let!(:playlist) { create(:playlist) }
  let(:playlist_id) { playlist.id }

  subject do
    Playlist::Show.call(
      id: playlist_id
    )
  end

  describe "find" do
    let(:playlist_id) { -123 }

    it "should raise an error" do
      expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'persistence' do
    it "should fetch the playlist" do
      expect(subject['model']).to eq(playlist)
    end
  end
end
