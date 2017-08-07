require 'rails_helper'

describe Artist, type: :model do
  describe "associations" do
    it { should have_many(:albums).dependent(:destroy) }
    it { should have_many(:songs).dependent(:destroy) }
  end
end
