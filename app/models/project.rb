class Project < ApplicationRecord
  belongs_to :category
  has_many_attached :images

  validates :title, presence: true
  validates :description, presence: true

  scope :published, -> { where(published: true) }
  scope :recent, -> { order(created_at: :desc) }

  def cover_image
    images.first
  end
end
