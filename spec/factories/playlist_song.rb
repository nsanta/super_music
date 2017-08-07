FactoryGirl.define do
  factory :playlist_song do
    playlist { create(:playlist) }
    song { create(:song) }
  end
end
