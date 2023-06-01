class Movie < ApplicationRecord
  # Movie has one to many relationship with bookmarks though association
  has_many :bookmarks
  has_many :lists, through: :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
