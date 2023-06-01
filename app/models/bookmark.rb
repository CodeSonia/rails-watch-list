class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :movie, presence: true
  validates :list, presence: true

  validates :comment, length: { minimum: 6 } # comment cannot be shorter than 6 characters
  validates :movie_id, uniqueness: { scope: :list_id } # is unique for a given movie/list couple
end
