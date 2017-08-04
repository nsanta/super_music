require 'rails_helper'

describe Artist, type: :model do
  describe "associations" do
    it { should have_many(:albums) }
    it { should have_many(:songs) }
  end
end
