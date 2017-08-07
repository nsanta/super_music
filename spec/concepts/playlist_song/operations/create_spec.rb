require 'rails_helper'

describe PlaylistSong::Create do
  let(:playlist) { create(:playlist) }
  let(:song) { create(:song) }
  let(:song_id) { song.id }
  let(:playlist_id) { playlist.id }
  let(:playlist_song_params) do
    {
      song_id: song_id,
      playlist_id: playlist_id
    }
  end

  subject do
    PlaylistSong::Create.call(
      playlist_song: playlist_song_params
    )
  end

  describe "validations" do
    context "when song_id is not present" do
      let(:song_id) { nil }
      it "should not be success" do
        expect(subject.success?).to eq(false)
      end
    end

    context "when playlist_id is not present" do
      let(:playlist_id) { nil }
      it "should not be success" do
        expect(subject.success?).to eq(false)
      end
    end
  end

  describe 'persistence' do
    it "should create the playlist_song" do
      expect(subject['model'].persisted?).to eq(true)
      expect(subject['model'].song_id).to eq(song_id)
      expect(subject['model'].playlist_id).to eq(playlist_id)
    end
  end
end
