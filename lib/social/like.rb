module Social
  class LikeClient < Social::Base

    def create_rand(resource_id, max_likes = 10)
      likes = rand(max_likes)    
      likes.times {create(resource_id, rand_user[:user_id])}
      likes
    end
  
    def create(resource_id, user_id)
      resp = RestClient.post "#{@base_url}/recommendations", {:resourceId => resource_id, :userId => user_id}.to_json, {:content_type => :json}
    end
  
    def to_s
      "LikeClient [base: #{@base_url}]"
    end
  
  end
end