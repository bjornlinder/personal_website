class Post < ActiveRecord::Base
  validates :path, presence: true
  validates :title, presence: true
  # validates :media_preview, default: :media
  # before statements - activerecord callbacks
  # seed files
  #  :date, default: 5
end
