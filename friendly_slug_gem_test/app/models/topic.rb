class Topic < ApplicationRecord
  build_friendly_slug :title, use: :database
end
