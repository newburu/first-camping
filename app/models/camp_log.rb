class CampLog < ApplicationRecord
  belongs_to :camp_site
  belongs_to :user

  mount_uploaders :images, ImageUploader
  serialize :images

  has_rich_text :detail
end
