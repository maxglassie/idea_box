class Idea < ApplicationRecord
  validates :name, :description, presence: true

  belongs_to :category
  has_many :images, through: :image_ideas
end