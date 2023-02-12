class Property < ApplicationRecord
  include Rails.application.routes.url_helpers

  # データはアセットとして保管しておきたいので、trashedで論理削除
  enum status: { draft: 0, unpublished: 1, published: 2, trashed: 3 }

  has_many_attached :images
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :description
    validates :rental_period
    validates :price
    validates :status
  end

  scope :draft, -> { where(status: "draft") }
  scope :published, -> { where(status: "published") }

  def image_url
    return nil if !self.images.attached?
    
    image = self.images.first
    rails_storage_proxy_url(image)
  end
end
