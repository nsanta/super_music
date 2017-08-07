require 'rails_helper'

describe Song, type: :model do
  describe "associations" do
    it { should belong_to(:album) }
    it { should belong_to(:artist) }
    it { should have_many(:playlist_songs).dependent(:destroy) }
    it { should have_many(:playlists).through(:playlist_songs) }
  end
end
