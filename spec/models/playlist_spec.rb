require 'rails_helper'

describe Playlist, type: :model do
  describe "associations" do
    it { should have_many(:playlist_songs).dependent(:destroy) }
    it { should have_many(:songs).through(:playlist_songs) }
  end
end
