require 'rails_helper'

describe Album::Index do
  let!(:album) { create(:album) }

  subject do
    Album::Index.call
  end

  describe 'persistence' do
    it "should fetch a page of albums" do
      expect(subject['model']).to eq([album])
    end

    context "when name param is passed" do
      it "should return the albums searched by name" do
      end
    end
  end
end
