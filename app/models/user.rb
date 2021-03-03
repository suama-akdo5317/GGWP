class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :lockable, :timeoutable, :trackable, :omniauthable, omniauth_providers: [:twitter]

  validates :username, presence: true
  
  # ゲストログイン用
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now
      user.username = "Guest"
    end
  end

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  
  # すでにいいねしているかのメソッド
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_relationship, source: :user
  
  has_one_attached :avatar
  
  validate :validate_avatar
    # アバター画像のバリデーション内容
  def validate_avatar
    return unless avatar.attached?
    # 画像サイズの制限
    if avatar.blob.byte_size > 10.megabytes
      # エラーメッセージはi18nから取得
      errors.add(:avatar, :file_too_large)
    elsif !image?
      errors.add(:avatar, :file_type_not_image)
    end
  end

  # 拡張子でファイルの種類を確認
  def image?
    avatar.content_type.in?(%("image/jpeg image/jpg image/png"))
  end
  
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end


end
