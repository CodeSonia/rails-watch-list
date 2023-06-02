class List < ApplicationRecord
  # List model has one to many relationship with bookmarks
  # You can't delete a movie, if it is rererences in at least one bookmark
  # When you delete a list, it should delete all associated bookmarks, but not the movies referenced in other lists!
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  validates :name, presence: true, uniqueness: true

  has_one_attached :cover_image
end
