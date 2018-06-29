class Blog < ApplicationRecord
  build_friendly_slug :title, :id, use: :last
end
