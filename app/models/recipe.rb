class Recipe < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, :description, presence: true, :ingredients, presence: true, :instructions, presence: true, uniqueness: {case_sensitive: false}
end