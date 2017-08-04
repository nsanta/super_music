require 'rails_helper'

describe Album::Update do
  let(:name) { 'Beatles' }
  let(:cover_art) { "URL_TO_COVER_ART" }
  let(:artist) { create(:artist) }
  let(:album) { create(:album) }
  let(:album_id) { album.id }
  let(:artist_id) { artist.id }
  let(:album_params) do
    {
      name: name,
      cover_art: cover_art,
      artist_id: artist_id
    }
  end

  subject do
    Album::Update.call(
      album: album_params,
      id: album_id
    )
  end

  describe "find" do
    let(:album_id) { -123 }

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

    context "when artist_id is not present" do
      let(:artist_id) { nil }
      it "should not be success" do
        expect(subject.success?).to eq(false)
      end
    end
  end

  describe 'persistence' do
    it "should update the album" do
      subject
      album.reload
      expect(album.name).to eq(name)
      expect(album.cover_art).to eq(cover_art)
      expect(album.artist_id).to eq(artist_id)
    end
  end
end
