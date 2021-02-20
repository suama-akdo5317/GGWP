class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :lockable, :timeoutable, :trackable, :omniauthable, omniauth_providers: [:twitter]

  has_many :posts
  
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


end
