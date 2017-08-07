require 'rails_helper'

describe Artist::Show do
  let!(:artist) { create(:artist) }
  let(:artist_id) { artist.id }

  subject do
    Artist::Show.call(
      id: artist_id
    )
  end

  describe "find" do
    let(:artist_id) { -123 }

    it "should raise an error" do
      expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'persistence' do
    it "should fetch the artist" do
      expect(subject['model']).to eq(artist)
    end
  end
end
