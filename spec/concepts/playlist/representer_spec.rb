require 'rails_helper'

describe Playlist::Representer do
  let(:playlist) { create(:playlist) }
  subject { Playlist::Representer.new(playlist).to_json }
  let(:json) { playlist.slice(:id, :name).merge(songs: []) }

  it "should present the model" do
    expect(JSON.parse(subject)).to eq(json)
  end
end
