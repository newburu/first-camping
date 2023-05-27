class CampLog < ApplicationRecord
  belongs_to :camp_site
  belongs_to :user

  mount_uploaders :images, ImageUploader
  serialize :images

  has_rich_text :detail

  def self.ransackable_attributes(auth_object = nil)
    ["camp_site_id", "created_at", "detail", "end_day", "id", "images", "start_day", "updated_at", "user_id"]
  end

end
