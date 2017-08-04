class Api::V1::AlbumsController < ApplicationController
  resource_description do
    short 'Albums endpoint'
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
  param :query, String, desc: "The query to search by name"
  def index
    result = run Album::Index
    response_success(
      result["model"],
      page: (params[:page] || 1).to_i,
      size: result["model"].size,
      total: result["model"].total_count
    )
  end

  api!
  param :album, Hash, required: true do
    param :name, String, required: true, desc: "Album's name"
    param :cover_art, String, desc: "Album's cover_art"
    param :artist_id, Integer, desc: "The Album's Artist Id"
  end
  def create
    result = run Album::Create do |_operation|
      return render_no_content
    end
    response_error(result)
  end

  api!
  param :id, :number, required: true, desc: "The album's Id"
  def show
    result = run Album::Show
    response_success(result["model"])
  end

  api!
  param :id, :number, required: true, desc: "The album's Id"
  param :album, Hash, required: true do
    param :name, String, required: true, desc: "Album's name"
    param :cover_art, String, desc: "Album's cover_art"
    param :artist_id, Integer, desc: "The Album's Artist Id"
  end
  def update
    result = run Album::Update do |_operation|
      return render_no_content
    end
    response_error(result)
  end

  api!
  param :id, :number, required: true, desc: "The album's Id"
  def destroy
    run Album::Destroy
    render_no_content
  end
end
