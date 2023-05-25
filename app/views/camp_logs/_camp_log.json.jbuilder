json.extract! camp_log, :id, :camp_site_id, :user_id, :start_day, :end_day, :images, :detail, :created_at, :updated_at
json.url camp_log_url(camp_log, format: :json)
