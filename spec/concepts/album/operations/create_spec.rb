require 'rails_helper'

describe Album::Create do
  let(:name) { 'Beatles' }
  let(:cover_art) { "URL_TO_COVER_ART" }
  let(:artist) { create(:artist) }
  let(:artist_id) { artist.id }
  let(:album_params) do
    {
      name: name,
      cover_art: cover_art,
      artist_id: artist_id
    }
  end

  subject do
    Album::Create.call(
      album: album_params
    )
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
    it "should create the album" do
      expect(subject['model'].persisted?).to eq(true)
      expect(subject['model'].name).to eq(name)
      expect(subject['model'].cover_art).to eq(cover_art)
      expect(subject['model'].artist_id).to eq(artist_id)
    end
  end
end
