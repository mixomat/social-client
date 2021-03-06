module Social
  class CommentClient < Social::Base
    attr_accessor :resource_id

    def initialize(base_url)
      super(base_url)
      @like = Social::LikeClient.new(base_url)
    end
  
    def create_rand(resource_id)
      content = Faker::Lorem.paragraph(rand(15)+1)
      user = rand_user()

      yield create(resource_id, content, user[:name], user[:user_id]) if block_given?
    end
    
    def create_multiple_with_likes(resource_id, repeat = 1)
      repeat.times do
        create_rand(resource_id) do |c|
          count = @like.create_rand c[:resourceId]
          puts "created comment #{c[:resourceId]} for #{resource_id} with #{count} likes"
        end        
      end
    end
  
    def create(resource_id, content, name, user_id)
      resp = RestClient.post "#{@base_url}/comments", {:content => content, :author => {:name => name , :userId => user_id, }, :document => {:resourceId => resource_id }}.to_json, {:content_type => :json}
      parse_resp(resp)
    end
    
    def list(offset = 0, results = 10)
      resp = comments :relatedTo => @resource_id, :offset => offset, :results => results
      puts "comments: #{resp}\n\n"
    end
    
    def count
      get_json "#{@base_url}/comments/amount"
    end
  
    def comments(params)
      get_json("#{@base_url}/comments", params)
    end
  
    def to_s
      "CommentClient [base: #{@base_url}, resourceId: #{@resource_id}]"
    end


  end
end