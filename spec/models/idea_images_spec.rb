require 'rails_helper'

RSpec.describe Images, "associations", type: :model do
  it { should have_many(:image_ideas) }
  it { should have_many(:ideas).through(:image_ideas)}
end