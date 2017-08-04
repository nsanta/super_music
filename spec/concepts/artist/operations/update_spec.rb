require 'rails_helper'

describe Artist::Update do
  let!(:artist) { create(:artist) }
  let(:name) { 'Beatles' }
  let(:bio) { "Description" }
  let(:artist_params) do
    {
      name: name,
      bio: bio
    }
  end
  let(:artist_id) { artist.id }

  subject do
    Artist::Update.call(
      id: artist_id, artist: artist_params
    )
  end

  describe "find" do
    let(:artist_id) { -123 }

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
  end

  describe 'persistence' do
    it "should update the artist" do
      expect(subject['model'].id).to eq(artist.id)
      expect(subject['model'].name).to eq(name)
      expect(subject['model'].bio).to eq(bio)
    end
  end
end
