class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  def self.find_by_uid!(uid)
    User.find_by!("profile_name = :p OR id = :p", p: uid)
  end

  validate :acceptable_image

  def acceptable_image
    return unless avatar.attached?
  
    unless avatar.byte_size <= 5.megabyte
      errors.add(:avatar, "is too big")
    end
  
    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(avatar.content_type)
      errors.add(:avatar, "must be a JPEG or PNG")
    end
  end
end
