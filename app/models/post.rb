class Post < ActiveRecord::Base
  sync :all

  validates :title, presence: true
end
