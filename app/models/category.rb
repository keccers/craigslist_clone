class Category < ActiveRecord::Base
  has_many :posts
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
end
