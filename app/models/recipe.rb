class Recipe < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :ingredients, presence: true 
  validates :instructions, presence: true 
end