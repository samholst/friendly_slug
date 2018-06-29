class Blog < ApplicationRecord
  build_friendly_slug :title, :id, key_position: :last
end
