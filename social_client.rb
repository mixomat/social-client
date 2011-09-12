require "lib/social"

host = "localhost"
comment = Social::CommentClient.new("http://#{host}:8080/social-rest")

# create 10 random comments with random amount of likes
comment.create_multiple_with_likes("cm-intra-content-4977296", 10)

# create 5 random comment with likes for related language
comment.create_multiple_with_likes("cm-intra-content-4977704", 5)

# create 5 for fk portal
comment.create_multiple_with_likes("cm-intra-content-4977398", 5)
