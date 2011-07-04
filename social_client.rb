require "lib/social"

comment_client = Social::CommentClient.new("http://admin:admin@localhost:8080/social-rest", "cm-intra-content-4977296")
like_client = Social::LikeClient.new("http://admin:admin@localhost:8080/social-rest")

# create 2 random comments with random amount of likes
2.times do
  comment_client.create_rand do |c|
    count = like_client.create_rand c[:resourceId]
    puts "created comment #{c[:resourceId]} for author #{c[:author][:name]} with #{count} likes"
  end
end

# create 3 likes for given resource id
#3.times {like_client.create_rand "cm-intra-comment-1"}
