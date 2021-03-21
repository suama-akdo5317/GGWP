class Post < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true
  
  # youtube_urlのバリデーション
  VALID_YOUTUBE_URL = /(\Ahttps:\/\/www\.youtube\.com\/watch\?v=)+[\w]{11}\z/
  validates :youtube_url, format: { with: VALID_YOUTUBE_URL }, allow_blank: true
  
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many_attached :image
  
end
