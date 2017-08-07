class Api::V1::SongsController < ApplicationController
  resource_description do
    name "Songs"
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
  param :page, :number, desc: "The page number to be requested"
  param :name, String, desc: "the query search by name"
  param :artist_id, :number, desc: "The Artist id related to the songs"
  param :album_id, :number, desc: "The Album id related to the songs"
  def index
    result = run Song::Index
    response_success(
      result["model"],
      page: (params[:page] || 1).to_i,
      size: result["model"].size,
      total: result["model"].total_count
    )
  end

  api!
  param :song, Hash, required: true do
    param :name, String, required: true, desc: "Song's name"
    param :duration, :number, required: true, desc: "Song's duration"
    param :genre, Array, in: Song::ContractForm::GENRES, required: true, desc: "Song's genre"
    param :song_id, :number, required: true, desc: "Song's song"
    param :artist_id, :number, required: true, desc: "Song's artist"
  end
  def create
    result = run Song::Create do |_operation|
      return render_no_content
    end
    response_error(result)
  end

  api!
  param :id, :number, required: true, desc: "The song's Id"
  def show
    result = run Song::Show
    response_success(result["model"])
  end

  api!
  param :id, :number, required: true, desc: "The song's Id"
  param :song, Hash, required: true do
    param :name, String, required: true, desc: "Song's name"
    param :duration, :number, required: true, desc: "Song's duration"
    param :genre, Array, in: Song::ContractForm::GENRES, required: true, desc: "Song's genre"
    param :song_id, :number, required: true, desc: "Song's song"
    param :artist_id, :number, required: true, desc: "Song's artist"
  end
  def update
    result = run Song::Update do |_operation|
      return render_no_content
    end
    response_error(result)
  end

  api!
  param :id, :number, required: true, desc: "The song's Id"
  def destroy
    run Song::Destroy
    render_no_content
  end
end
