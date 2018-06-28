class Blog < ApplicationRecord
  build_friendly_slug :title, :id
end
