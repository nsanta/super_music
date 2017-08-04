require 'rails_helper'

describe Album::Destroy do
  let!(:album) { create(:album) }
  let(:album_id) { album.id }

  subject do
    Album::Destroy.call(
      id: album_id
    )
  end

  describe "find" do
    let(:album_id) { -123 }

    it "should raise an error" do
      expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'persistence' do
    it "should destroy the album" do
      subject
      expect(Album.find_by(id: album_id)).to eq(nil)
    end
  end
end
