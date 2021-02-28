class Post < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many_attached :image
  
  def thumbnail input
    return self.image[input].variant(resize: '300x300!').processed
  end
  
  
end
