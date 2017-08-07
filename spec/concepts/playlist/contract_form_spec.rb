require 'rails_helper'

describe Playlist::ContractForm do
  let!(:playlist) { create(:playlist) }
  let(:name) { 'Beatles' }
  let(:playlist_params) do
    {
      name: name
    }
  end

  subject { Playlist::ContractForm.new(playlist) }

  describe "validations" do
    it "should be success" do
      expect(subject.validate(playlist_params)).to eq(true)
    end

    context "when name is not present" do
      let(:name) { nil }
      it "should not be success" do
        expect(subject.validate(playlist_params)).to eq(false)
      end
    end
  end
end
