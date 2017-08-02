require 'rails_helper'

describe Artist::Create do
  let(:name) { 'Beatles' }
  let(:bio) { "Description" }
  let(:artist_params) do
    {
      name: name,
      bio: bio
    }
  end

  subject do
    Artist::Create.call(
      artist: artist_params
    )
  end

  describe "validations" do
    context "when name is not present" do
      let(:name) { nil }
      it "should not be success" do
        expect(subject.success?).to eq(false)
      end
    end
  end

  describe 'persistence' do
    it "should create the artist" do
      expect(subject['model'].persisted?).to eq(true)
      expect(subject['model'].name).to eq(name)
      expect(subject['model'].bio).to eq(bio)
    end
  end
end
