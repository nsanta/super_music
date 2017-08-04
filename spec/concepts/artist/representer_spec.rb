require 'rails_helper'

describe Artist::Representer do
  let(:artist) { create(:artist) }
  subject { Artist::Representer.new(artist).to_json }
  let(:json) { artist.slice(:id, :name, :bio) }

  it "should present the model" do
    expect(JSON.parse(subject)).to eq(json)
  end
end
