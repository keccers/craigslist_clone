class Post < ActiveRecord::Base
  belongs_to :category

  validates :title, presence: true
  validates :text, presence: true
  validates :email, presence: true
end
