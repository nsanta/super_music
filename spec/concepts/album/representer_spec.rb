require 'rails_helper'

describe Album::Representer do
  let(:album) { create(:album, artist: artist) }
  let(:artist) { create(:artist) }
  subject { Album::Representer.new(album).to_json }
  let(:json) { album.slice(:id, :name, :cover_art).merge(artist: artist_json) }
  let(:artist_json) { artist.slice(:id, :name, :bio) }

  it "should present the model" do
    expect(JSON.parse(subject)).to eq(json)
  end
end
