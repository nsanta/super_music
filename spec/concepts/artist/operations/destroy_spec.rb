require 'rails_helper'

describe Artist::Destroy do
  let!(:artist) { create(:artist) }
  let(:artist_id) { artist.id }

  subject do
    Artist::Destroy.call(
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
    it "should destroy the artist" do
      subject
      expect(Artist.find_by(id: artist_id)).to eq(nil)
    end
  end
end
