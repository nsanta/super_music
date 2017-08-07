class PlaylistSong::Destroy < Trailblazer::Operation
  step :find_model
  step :destroy

  def find_model(options, **)
    options['model'] = PlaylistSong::find_by!(
      song_id: options['params'][:song_id],
      playlist_id: options['params'][:playlist_id]
    )
  end

  def destroy(options, **)
    options['model'].destroy
  end
end
