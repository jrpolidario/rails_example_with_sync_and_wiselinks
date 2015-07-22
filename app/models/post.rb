class Post < ActiveRecord::Base
  sync :all

  validates :title, presence: true
  validates :content, presence: true
end
