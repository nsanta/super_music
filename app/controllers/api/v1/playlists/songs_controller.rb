class Api::V1::Playlists::SongsController < ApplicationController
  resource_description do
    short 'Songs endpoint'
    formats ['json']
    error 404, "Missing"
    error 500, "Server crashed "
    error 422, "Could not save the entity."
    error 401, "Bad request"
    description <<-EOS
      Super Music API for everyone.
    EOS
  end

  api!
  param :song_id, :number, required: true, desc: "Playlist's Song Id"
  param :playlist_id, :number, required: true, desc: "Playlist Id"
  def create
    result = PlaylistSong::Create.call(playlist_song: params.permit(:song_id, :playlist_id)) do
      return render_no_content
    end
    response_error(result)
  end

  api!
  param :song_id, :number, required: true, desc: "Playlist's Song Id"
  param :playlist_id, :number, required: true, desc: "Playlist Id"
  def destroy
    PlaylistSong::Destroy.call(params.permit(:song_id, :playlist_id))
    render_no_content
  end
end
