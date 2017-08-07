require 'rails_helper'

describe Song::Destroy do
  let!(:song) { create(:song) }
  let(:song_id) { song.id }

  subject do
    Song::Destroy.call(
      id: song_id
    )
  end

  describe "find" do
    let(:song_id) { -123 }

    it "should raise an error" do
      expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'persistence' do
    it "should destroy the Song" do
      subject
      expect(Song.find_by(id: song_id)).to eq(nil)
    end
  end
end
