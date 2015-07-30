collection :articles do
  entity     Article
  repository ArticleRepository

  attribute :id,         Integer
  attribute :title,      String
  attribute :content,    String
  attribute :user_id,    Integer
  attribute :created_at, DateTime
  attribute :updated_at, DateTime
end