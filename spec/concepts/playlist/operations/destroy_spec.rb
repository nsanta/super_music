require 'rails_helper'

describe Playlist::Destroy do
  let!(:playlist) { create(:playlist) }
  let(:playlist_id) { playlist.id }

  subject do
    Playlist::Destroy.call(
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
    it "should destroy the playlist" do
      subject
      expect(Playlist.find_by(id: playlist_id)).to eq(nil)
    end
  end
end
