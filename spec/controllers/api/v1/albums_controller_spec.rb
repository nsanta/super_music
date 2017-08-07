require 'rails_helper'

RSpec.describe Api::V1::AlbumsController, type: :controller do
  let(:artist) { create(:artist) }
  let(:json_body) do
    JSON.parse(response.body, symbolize_names: true)
  end
  let(:data) do
    json_body[:data]
  end
  let(:meta) { json_body[:meta] }

  describe "GET #index" do
    let!(:album) { create(:album) }
    let(:params) { {} }
    subject { get :index, params: params }

    it "should succeed" do
      subject
      expect(response.success?).to eq(true)
    end

    it "should provide a list of albums" do
      subject
      expect(data.first[:id]).to eq(album.id)
    end

    context "pagination" do
      before do
        30.times { create(:album) }
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
    let(:name) { "Album's Name" }
    let(:cover_art) { "cover_art" }
    let(:params) do
      {
        album: { name: name, cover_art: cover_art, artist_id: artist }
      }
    end

    subject { post :create, params: params }

    it "should respond with a 204" do
      subject
      expect(response.status).to eq(204)
    end

    it "should create the album" do
      expect { subject }.to change { Album.count }.by(1)
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
    let!(:album) { create(:album) }
    let(:album_id) { album.id }

    let(:params) { { id: album_id } }

    subject { get :show, params: params }

    it "should succeed" do
      subject
      expect(response.success?).to eq(true)
    end

    it "should show the album" do
      subject
      expect(data[:name]).to eq(album.name)
      expect(data[:cover_art]).to eq(album.cover_art)
    end

    context "when the resource is not found" do
      let(:album_id) { -123 }

      it "should respond with a 404" do
        subject
        expect(response.status).to eq(404)
      end
    end
  end

  describe "PUT #update" do
    let!(:album) { create(:album) }
    let(:name) { "Album's Name" }
    let(:cover_art) { "cover_art" }

    let(:params) do
      {
        id: album.id,
        album: { name: name, cover_art: cover_art, artist_id: artist }
      }
    end

    subject { put :update, params: params }

    it "should respond with a 204" do
      subject
      expect(response.status).to eq(204)
    end

    it "should update the album" do
      subject
      album.reload
      expect(album.name).to eq(name)
      expect(album.cover_art).to eq(cover_art)
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
    let!(:album) { create(:album) }
    let(:album_id) { album.id }

    let(:params) { { id: album_id } }

    subject { delete :destroy, params: params }

    it "should succeed" do
      subject
      expect(response.success?).to eq(true)
    end

    it "should respond with a 204" do
      subject
      expect(response.status).to eq(204)
    end

    it "should delte the album" do
      expect { subject }.to change { Album.count }.by(-1)
    end

    context "when the resource is not found" do
      let(:album_id) { -123 }

      it "should respond with a 404" do
        subject
        expect(response.status).to eq(404)
      end
    end
  end
end
