require 'rails_helper'

describe Song::Update do
  let!(:song) { create(:song) }
  let(:album) { create(:album, artist: artist) }
  let(:artist) { create(:artist) }
  let(:name) { 'While my guitar gentle weeps' }
  let(:genre) { 'rock' }
  let(:duration) { 3000 }
  let(:artist_id) { artist.id }
  let(:album_id) { album.id }
  let(:song_id) { song.id }
  let(:song_params) do
    {
      name: name,
      duration: duration,
      genre: genre,
      artist_id: artist_id,
      album_id: album_id
    }
  end

  subject do
    Song::Update.call(
      song: song_params,
      id: song_id
    )
  end

  describe "find" do
    let(:song_id) { -123 }

    it "should raise an error" do
      expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "validations" do
    context "when name is not present" do
      let(:name) { nil }
      it "should not be success" do
        expect(subject.success?).to eq(false)
      end
    end

    context "when duration is not present" do
      let(:duration) { nil }
      it "should not be success" do
        expect(subject.success?).to eq(false)
      end
    end

    context "when duration is less than 1" do
      let(:duration) { 0 }
      it "should not be success" do
        expect(subject.success?).to eq(false)
      end
    end

    context "when the genre is less not included in the list" do
      let(:genre) { 'Tango' }
      it "should not be success" do
        expect(subject.success?).to eq(false)
      end
    end

    context "when artist is not present" do
      let(:artist_id) { nil }
      it "should not be success" do
        expect(subject.success?).to eq(false)
      end
    end

    context "when album is not present" do
      let(:album_id) { nil }
      it "should not be success" do
        expect(subject.success?).to eq(false)
      end
    end
  end

  describe 'persistence' do
    it "should update the song" do
      subject
      song.reload
      expect(song.name).to eq(name)
      expect(song.duration).to eq(duration)
      expect(song.genre).to eq(genre)
      expect(song.artist_id).to eq(artist_id)
      expect(song.album_id).to eq(album_id)
    end
  end
end
