require 'rails_helper'

describe PlaylistSong::Destroy do
  let!(:song) { create(:song) }
  let!(:playlist) { create(:playlist) }
  let!(:playlist_song) do
    create(:playlist_song, song: song, playlist: playlist)
  end
  let(:song_id) { song.id }
  let(:playlist_id) { playlist.id }

  subject do
    PlaylistSong::Destroy.call(
      song_id: song_id,
      playlist_id: playlist_id
    )
  end

  describe "find" do
    let(:song_id) { -123 }

    it "should raise an error" do
      expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'persistence' do
    it "should destroy the PlaylistSong" do
      subject
      expect(PlaylistSong.find_by(id: song_id)).to eq(nil)
    end
  end
end
