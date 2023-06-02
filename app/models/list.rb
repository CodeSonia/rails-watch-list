class List < ApplicationRecord
  # List model has one to many relationship with bookmarks
  # You can't delete a movie, if it is rererences in at least one bookmark
  # When you delete a list, it should delete all associated bookmarks, but not the movies referenced in other lists!
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  validates :name, presence: true, uniqueness: true
  validate :validate_cover_image

  has_one_attached :cover_image

  private

  def validate_cover_image
    return unless cover_image.attached?

    if !cover_image.blob.content_type.starts_with?('image/')
      cover_image.purge
      errors.add(:cover_image, 'must be an image')
    elsif cover_image.blob.byte_size > 5.megabytes
      cover_image.purge
      errors.add(:cover_image, 'size cannont exceed 5MB')
    end
  end
end
