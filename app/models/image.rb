class Image < ApplicationRecord
  has_many :ideas, through: :image_ideas
end