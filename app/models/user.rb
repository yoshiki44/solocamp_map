class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: "user_id"
  #以下2文を追加
  has_many :bookmarks, dependent: :destroy
  # ↓お気に入りにしている掲示板を取得する
  has_many :bookmarks_posts, through: :bookmarks, source: :post

  mount_uploader :icon, ImageUploader

  # お気に入り追加
  # <<で引数で渡した掲示板の情報がbookmark_postsに入っている
  def bookmark(post)
    bookmarks_posts << post
  end

  # お気に入りを外す
  def unbookmark(post)
    bookmarks_posts.delete(post)
  end

  # お気に入り登録しているか判定するメソッド
  def bookmark?(post)
    bookmarks_posts.include?(post)
  end

  def own?(object)
    self.id == object.user_id
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
end
