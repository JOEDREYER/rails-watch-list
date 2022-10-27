class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  # comment cannot be shorter than 6 characters (FAILED - 1)
  validates :comment, length: {minimum: 6}
  # validates :comment, :uniqueness => { :scope => :movie_id }
  # validates :comment, :uniqueness => { :scope => :list_id }
  validates_uniqueness_of :list_id, :scope => [:movie_id]
  # is unique for a given movie/list couple (FAILED - 1)
end
