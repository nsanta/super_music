require 'rails_helper'

describe Album::ContractForm do
  let!(:album) { build(:album) }
  let(:artist) { create(:artist) }
  let(:name) { 'Beatles' }
  let(:cover_art) { "cover_art_URL" }
  let(:artist_id) { artist.id }
  let(:album_params) do
    {
      name: name,
      cover_art: cover_art,
      artist_id: artist_id
    }
  end

  subject { Album::ContractForm.new(album) }

  describe "validations" do
    it "should be success" do
      expect(subject.validate(album_params)).to eq(true)
    end

    context "when name is not present" do
      let(:name) { nil }
      it "should not be success" do
        expect(subject.validate(album_params)).to eq(false)
      end
    end

    context "when artist is not present" do
      let(:artist_id) { nil }
      it "should not be success" do
        expect(subject.validate(album_params)).to eq(false)
      end
    end
  end
end
