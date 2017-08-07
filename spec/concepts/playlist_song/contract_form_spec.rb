require 'rails_helper'

describe PlaylistSong::ContractForm do
  let(:album) { create(:album, artist: artist) }
  let(:artist) { create(:artist) }
  let(:playlist) { create(:playlist) }
  let(:song) { create(:song, album: album, artist: artist) }
  let(:playlist_song) { build(:playlist_song) }
  let(:playlist_id) { playlist.id }
  let(:song_id) { song.id }
  let(:playlist_song_params) do
    {
      playlist_id: playlist_id,
      song_id: song_id
    }
  end

  subject { PlaylistSong::ContractForm.new(playlist_song) }

  describe "validations" do
    it "should be success" do
      expect(subject.validate(playlist_song_params)).to eq(true)
    end

    context "when playlist_id is not present" do
      let(:playlist_id) { nil }
      it "should not be success" do
        expect(subject.validate(playlist_song_params)).to eq(false)
      end
    end

    context "when song_id is not present" do
      let(:song_id) { nil }
      it "should not be success" do
        expect(subject.validate(playlist_song_params)).to eq(false)
      end
    end

    context "when playlist_song already exists with the same song and playlist" do
      let!(:other_playlist_song) do
        create(:playlist_song, song_id: song_id, playlist_id: playlist_id)
      end

      it "should not be success" do
        expect(subject.validate(playlist_song_params)).to eq(false)
      end
    end
  end
end
