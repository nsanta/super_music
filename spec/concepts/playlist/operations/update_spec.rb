require 'rails_helper'

describe Playlist::Update do
  let!(:playlist) { create(:playlist) }
  let(:name) { 'Beatles List' }
  let(:playlist_params) do
    {
      name: name
    }
  end
  let(:playlist_id) { playlist.id }

  subject do
    Playlist::Update.call(
      id: playlist_id, playlist: playlist_params
    )
  end

  describe "find" do
    let(:playlist_id) { -123 }

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
    it "should update the playlist" do
      expect(subject['model'].id).to eq(playlist.id)
      expect(subject['model'].name).to eq(name)
    end
  end
end
