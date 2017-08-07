require 'rails_helper'

describe Playlist::Create do
  let(:name) { 'Beatles' }
  let(:playlist_params) do
    {
      name: name
    }
  end

  subject do
    Playlist::Create.call(
      playlist: playlist_params
    )
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
    it "should create the playlist" do
      expect(subject['model'].persisted?).to eq(true)
      expect(subject['model'].name).to eq(name)
    end
  end
end
