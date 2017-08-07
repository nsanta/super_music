require 'rails_helper'

describe Artist::ContractForm do
  let!(:artist) { create(:artist) }
  let(:name) { 'Beatles' }
  let(:bio) { "Description" }
  let(:artist_params) do
    {
      name: name,
      bio: bio
    }
  end

  subject { Artist::ContractForm.new(artist) }

  describe "validations" do
    it "should be success" do
      expect(subject.validate(artist_params)).to eq(true)
    end

    context "when name is not present" do
      let(:name) { nil }
      it "should not be success" do
        expect(subject.validate(artist_params)).to eq(false)
      end
    end
  end
end
