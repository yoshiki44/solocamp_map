class Post < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  def bookmarked_by(user)
    Bookmark.find_by(user_id: user.id, post_id: id)
  end

  mount_uploader :image, ImageUploader
end
