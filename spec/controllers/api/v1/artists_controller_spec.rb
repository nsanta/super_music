require 'rails_helper'

RSpec.describe Api::V1::ArtistsController, type: :controller do
  let(:json_body) do
    JSON.parse(response.body, symbolize_names: true)
  end
  let(:data) do
    json_body[:data]
  end
  let(:meta) { json_body[:meta] }

  describe "GET #index" do
    let!(:artist) { create(:artist) }
    let(:params) { {} }
    subject { get :index, params: params }

    it "should succeed" do
      subject
      expect(response.success?).to eq(true)
    end

    it "should provide a list of artists" do
      subject
      expect(data.first[:id]).to eq(artist.id)
    end

    context "pagination" do
      before do
        30.times { create(:artist) }
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
    let(:bio) { "bio" }
    let(:params) do
      {
        artist: { name: name, bio: bio }
      }
    end

    subject { post :create, params: params }

    it "should succeed" do
      subject
      expect(response.success?).to eq(true)
    end

    it "should create the artist" do
      expect { subject }.to change { Artist.count }.by(1)
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
    let!(:artist) { create(:artist) }
    let(:artist_id) { artist.id }

    let(:params) { { id: artist_id } }

    subject { get :show, params: params }

    it "should succeed" do
      subject
      expect(response.success?).to eq(true)
    end

    it "should show the artist" do
      subject
      expect(data[:name]).to eq(artist.name)
      expect(data[:bio]).to eq(artist.bio)
    end

    context "when the resource is not found" do
      let(:artist_id) { -123 }

      it "should respond with a 404" do
        subject
        expect(response.status).to eq(404)
      end
    end
  end

  describe "PUT #update" do
    let!(:artist) { create(:artist) }
    let(:name) { "Album's Name" }
    let(:bio) { "bio" }

    let(:params) do
      {
        id: artist.id,
        artist: { name: name, bio: bio }
      }
    end

    subject { put :update, params: params }

    it "should succeed" do
      subject
      expect(response.success?).to eq(true)
    end

    it "should update the artist" do
      subject
      artist.reload
      expect(artist.name).to eq(name)
      expect(artist.bio).to eq(bio)
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
    let!(:artist) { create(:artist) }
    let(:artist_id) { artist.id }

    let(:params) { { id: artist_id } }

    subject { delete :destroy, params: params }

    it "should succeed" do
      subject
      expect(response.success?).to eq(true)
    end

    it "should respond with a 204" do
      subject
      expect(response.status).to eq(204)
    end

    it "should delte the artist" do
      expect { subject }.to change { Artist.count }.by(-1)
    end

    context "when the resource is not found" do
      let(:artist_id) { -123 }

      it "should respond with a 404" do
        subject
        expect(response.status).to eq(404)
      end
    end
  end
end
