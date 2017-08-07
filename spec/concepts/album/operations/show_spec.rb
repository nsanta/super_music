require 'rails_helper'

describe Album::Show do
  let!(:album) { create(:album) }
  let(:album_id) { album.id }

  subject do
    Album::Show.call(
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
    it "should fetch the album" do
      expect(subject['model']).to eq(album)
    end
  end
end
