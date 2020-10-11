class Recipe < ApplicationRecord
  has_one_attached :main_image

  has_many :ingredients
  has_many :directions
  
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
 	accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true

  validate :acceptable_image

  def acceptable_image
    return unless main_image.attached?
  
    unless main_image.byte_size <= 5.megabyte
      errors.add(:main_image, "is too big")
    end
  
    acceptable_types = ["image/jpeg", "image/jpg", "image/png"]
    unless acceptable_types.include?(main_image.content_type)
      errors.add(:main_image, "must be a JPEG or PNG")
    end
  end
end
