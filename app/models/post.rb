class Post < ActiveRecord::Base
  belongs_to :category

  validates_presence_of :title, :text, :email, :key
end
