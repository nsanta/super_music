require 'rails_helper'

describe Album, type: :model do
  describe "associations" do
    it { should belong_to(:artist) }
  end
end
