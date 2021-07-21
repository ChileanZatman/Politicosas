json.extract! news, :id, :title, :link, :release, :email, :origin_id, :origin_type, :state, :created_at, :updated_at
json.url news_url(news, format: :json)
