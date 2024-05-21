class Project < ApplicationRecord
  belongs_to :technology
  has_one_attached :image
end
