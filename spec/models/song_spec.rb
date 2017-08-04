require 'rails_helper'

describe Song, type: :model do
  describe "associations" do
    it { should belong_to(:album) }
    it { should belong_to(:artist) }
  end
end
