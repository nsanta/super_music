require 'rails_helper'

describe PlaylistSong, type: :model do
  describe "associations" do
    it { should belong_to(:playlist) }
    it { should belong_to(:song) }
  end
end
