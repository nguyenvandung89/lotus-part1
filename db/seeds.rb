[
  {
    title: "Article1",
    content: "Nguyen Van Dung",
    user_id: 1
  },
  {
    title: "Article2",
    content: "Pham Thi Chieu",
    user_id: 1
  }
].each do |article|
  new_article = Article.new(article)
  ArticleRepository.persist(new_article)
end