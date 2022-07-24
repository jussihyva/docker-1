article = Article.new(title: "Hello Rails", body: "I am on Rails!")
article.save
article
article = Article.new(title: "Hello Hive", body: "I am working for docker-1 project!")
article.save
article
Article.find(1)
Article.all
