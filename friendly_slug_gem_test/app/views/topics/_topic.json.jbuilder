json.extract! topic, :id, :title, :slug, :type, :views, :created_at, :updated_at
json.url topic_url(topic, format: :json)
