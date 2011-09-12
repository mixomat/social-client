module Social
  class LikeClient < Social::Base

    def create_rand(resource_id, max_likes = 10)
      likes = rand(max_likes)    
      likes.times do
        user = rand_user()
        create(resource_id, user[:name], user[:user_id])
      end
      likes
    end
  
    def create(resource_id, name, user_id)
      resp = RestClient.post "#{@base_url}/recommendations", {:resourceId => resource_id, :author => {:name => name , :userId => user_id }}.to_json, {:content_type => :json}
    end
  
    def to_s
      "LikeClient [base: #{@base_url}]"
    end
  
  end
end