class Api::V1::ArtistsController < ApplicationController
  resource_description do
    short 'Artists endpoint'
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
    result = run Artist::Index
    response_success(
      result["model"],
      page: (params[:page] || 1).to_i,
      size: result["model"].size,
      total: result["model"].total_count
    )
  end

  api!
  param :artist, Hash, required: true do
    param :name, String, required: true, desc: "Artist's name"
    param :bio, String, desc: "Artist's bio"
  end
  def create
    result = run Artist::Create do |operation|
      return response_success(operation['model'])
    end
    response_error(result)
  end

  api!
  param :id, :number, required: true, desc: "The album's Id"
  def show
    result = run Artist::Show
    response_success(result["model"])
  end

  api!
  param :id, :number, required: true, desc: "The album's Id"
  param :artist, Hash, required: true do
    param :name, String, required: true, desc: "Artist's name"
    param :bio, String, desc: "Artist's bio"
  end
  def update
    result = run Artist::Update do |operation|
      return response_success(operation['model'])
    end
    response_error(result)
  end

  api!
  param :id, :number, required: true, desc: "The album's Id"
  def destroy
    run Artist::Destroy
    render nothing: true, status: 204
  end
end
