class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, uniqueness: true, length: { maximum: 20 }

  has_one_attached :profile_image

  has_many :books, dependent: :destroy

  def get_profile_image(weight, height)
    unless profile_image.attached?
      file_path = Rails.root.join("app/assets/images/nc209714.jpg")
      profile_image.attach(io: File.open(file_path), filename: "dedault-image.jpg", content_type: "image/jpeg")
    end
    profile_image.variant(resize_to_limit: [weight, height]).processed
  end

end
