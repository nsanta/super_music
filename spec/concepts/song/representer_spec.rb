require 'rails_helper'

describe Song::Representer do
  let(:song) { create(:song, artist: artist, album: album) }
  let(:album) { create(:album, artist: artist) }
  let(:artist) { create(:artist) }
  subject { Song::Representer.new(song).to_json }
  let(:json) do
    song.slice(:id, :name, :duration, :genre)
        .merge(artist: artist_json)
        .merge(album: album_json.merge(artist_json))
  end
  let(:artist_json) { artist.slice(:id, :name, :bio) }
  let(:album_json) { album.slice(:id, :name, :cover_art) }

  it "should present the model" do
    expect(JSON.parse(subject)).to eq(json)
  end
end
