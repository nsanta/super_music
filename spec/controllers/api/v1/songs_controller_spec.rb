require 'rails_helper'

RSpec.describe Api::V1::SongsController, type: :controller do
  let(:artist) { create(:artist) }
  let(:album) { create(:album) }

  let(:json_body) do
    JSON.parse(response.body, symbolize_names: true)
  end
  let(:data) do
    json_body[:data]
  end
  let(:meta) { json_body[:meta] }

  describe "GET #index" do
    let!(:song) { create(:song) }
    let(:params) { {} }
    subject { get :index, params: params }

    it "should succeed" do
      subject
      expect(response.success?).to eq(true)
    end

    it "should provide a list of songs" do
      subject
      expect(data.first[:id]).to eq(song.id)
    end

    context "pagination" do
      before do
        30.times { create(:song) }
      end
      context "default page" do
        let(:params) { {} }

        it "should return the first page with meta data" do
          subject
          expect(data.length).to eq(25)
          expect(meta[:page]).to eq(1)
          expect(meta[:size]).to eq(25)
          expect(meta[:total]).to eq(31)
        end
      end

      context "selected page" do
        let(:params) { { page: 2 } }
        it "should return the second page  with meta data" do
          subject
          expect(data.length).to eq(6)
          expect(meta[:page]).to eq(2)
          expect(meta[:size]).to eq(6)
          expect(meta[:total]).to eq(31)
        end
      end
    end
  end

  describe "POST #create" do
    let(:name) { 'While my guitar gentle weeps' }
    let(:genre) { 'rock' }
    let(:duration) { 300 }
    let(:artist_id) { artist.id }
    let(:album_id) { album.id }
    let(:song_params) do
      {
        name: name,
        duration: duration,
        genre: genre,
        artist_id: artist_id,
        album_id: album_id
      }
    end

    let(:params) do
      {
        song: song_params
      }
    end

    subject { post :create, params: params }

    it "should respond with a 204" do
      subject
      expect(response.status).to eq(204)
    end

    it "should create the song" do
      expect { subject }.to change { Song.count }.by(1)
    end

    context "when is invalid" do
      let(:name) { "" }

      it "should respond with a 400" do
        subject
        expect(response.status).to eq(400)
      end

      it "should respond with errors" do
        subject
        expect(json_body[:errors][:name]).to eq(["can't be blank"])
      end
    end
  end

  describe "GET #show" do
    let!(:song) { create(:song) }
    let(:song_id) { song.id }

    let(:params) { { id: song_id } }

    subject { get :show, params: params }

    it "should succeed" do
      subject
      expect(response.success?).to eq(true)
    end

    it "should show the song" do
      subject
      expect(data[:name]).to eq(song.name)
      expect(data[:duration]).to eq(song.duration)
      expect(data[:genre]).to eq(song.genre)
    end

    context "when the resource is not found" do
      let(:song_id) { -123 }

      it "should respond with a 404" do
        subject
        expect(response.status).to eq(404)
      end
    end
  end

  describe "PUT #update" do
    let!(:song) { create(:song) }
    let(:name) { 'While my guitar gentle weeps' }
    let(:genre) { 'rock' }
    let(:duration) { 300 }
    let(:artist_id) { artist.id }
    let(:album_id) { album.id }
    let(:song_params) do
      {
        name: name,
        duration: duration,
        genre: genre,
        artist_id: artist_id,
        album_id: album_id
      }
    end

    let(:params) do
      {
        id: song.id,
        song: song_params
      }
    end

    subject { put :update, params: params }

    it "should respond with a 204" do
      subject
      expect(response.status).to eq(204)
    end

    it "should update the song" do
      subject
      song.reload
      expect(song.name).to eq(name)
      expect(song.duration).to eq(duration)
      expect(song.genre).to eq(genre)
      expect(song.artist_id).to eq(artist_id)
      expect(song.album_id).to eq(album_id)
    end

    context "when is invalid" do
      let(:name) { "" }

      it "should respond with a 400" do
        subject
        expect(response.status).to eq(400)
      end

      it "should respond with errors" do
        subject
        expect(json_body[:errors][:name]).to eq(["can't be blank"])
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:song) { create(:song) }
    let(:song_id) { song.id }

    let(:params) { { id: song_id } }

    subject { delete :destroy, params: params }

    it "should succeed" do
      subject
      expect(response.success?).to eq(true)
    end

    it "should respond with a 204" do
      subject
      expect(response.status).to eq(204)
    end

    it "should delte the song" do
      expect { subject }.to change { Song.count }.by(-1)
    end

    context "when the resource is not found" do
      let(:song_id) { -123 }

      it "should respond with a 404" do
        subject
        expect(response.status).to eq(404)
      end
    end
  end
end
