class Category < ApplicationRecord
  has_many :projects, dependent: :restrict_with_error
  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  before_validation :generate_slug

  private

  def generate_slug
    self.slug = name.parameterize if name.present?
  end
end
