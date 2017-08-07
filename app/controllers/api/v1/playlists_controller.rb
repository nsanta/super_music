class Api::V1::PlaylistsController < ApplicationController
  resource_description do
    short 'Playlists endpoint'
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
  param :page, :number, desc: "The page number to be requested"
  def index
    result = run Playlist::Index
    response_success(
      result["model"],
      page: (params[:page] || 1).to_i,
      size: result["model"].size,
      total: result["model"].total_count
    )
  end

  api!
  param :playlist, Hash, required: true do
    param :name, String, required: true, desc: "Playlist's name"
  end
  def create
    result = run Playlist::Create do |_operation|
      return render_no_content
    end
    response_error(result)
  end

  api!
  param :id, :number, required: true, desc: "The Playlist's Id"
  def show
    result = run Playlist::Show
    response_success(result["model"])
  end

  api!
  param :id, :number, required: true, desc: "The Playlist's Id"
  param :playlist, Hash, required: true do
    param :name, String, required: true, desc: "Playlist's name"
  end
  def update
    result = run Playlist::Update do |_operation|
      return render_no_content
    end
    response_error(result)
  end

  api!
  param :id, :number, required: true, desc: "The Playlist's Id"
  def destroy
    run Playlist::Destroy
    render_no_content
  end
end
