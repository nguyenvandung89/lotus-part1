require 'lotus/entity'

class Article
  include Lotus::Entity
  attributes :title, :content, :user_id, :created_at, :updated_at
end