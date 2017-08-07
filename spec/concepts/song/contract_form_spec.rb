require 'rails_helper'

describe Song::ContractForm do
  let(:album) { build(:album, artist: artist) }
  let(:artist) { create(:artist) }
  let(:song) { create(:song, album: album, artist: artist) }
  let(:name) { 'While my guitar gentle weeps' }
  let(:genre) { 'rock' }
  let(:duration) { 300 }
  let(:artist_id) { artist.id }
  let(:album_id) { album.id }
  let(:song_params) do
    {
      name: name,
      duration: duration,
      genre: genre,
      artist_id: artist_id,
      album_id: album_id
    }
  end

  subject { Song::ContractForm.new(song) }

  describe "validations" do
    it "should be success" do
      expect(subject.validate(song_params)).to eq(true)
    end

    context "when name is not present" do
      let(:name) { nil }
      it "should not be success" do
        expect(subject.validate(song_params)).to eq(false)
      end
    end

    context "when duration is not present" do
      let(:duration) { nil }
      it "should not be success" do
        expect(subject.validate(song_params)).to eq(false)
      end
    end

    context "when duration is less than 1" do
      let(:duration) { 0 }
      it "should not be success" do
        expect(subject.validate(song_params)).to eq(false)
      end
    end

    context "when the genre is less not included in the list" do
      let(:genre) { 'Tango' }
      it "should not be success" do
        expect(subject.validate(song_params)).to eq(false)
      end
    end

    context "when artist is not present" do
      let(:artist_id) { nil }
      it "should not be success" do
        expect(subject.validate(song_params)).to eq(false)
      end
    end

    context "when album is not present" do
      let(:album_id) { nil }
      it "should not be success" do
        expect(subject.validate(song_params)).to eq(false)
      end
    end
  end
end
