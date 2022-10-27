class Movie < ApplicationRecord
  validates :title, presence: true
  has_many :bookmarks
  validates :overview, presence: true
  validates :title, uniqueness: true
end
