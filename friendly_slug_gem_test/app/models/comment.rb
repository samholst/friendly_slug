class Comment < ApplicationRecord
  build_friendly_slug :id, :body, use: :first
  belongs_to :blog
end
