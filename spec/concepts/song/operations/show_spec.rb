require 'rails_helper'

describe Song::Show do
  let!(:song) { create(:song) }
  let(:song_id) { song.id }

  subject do
    Song::Show.call(
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
    it "should fetch the song" do
      expect(subject['model']).to eq(song)
    end
  end
end
