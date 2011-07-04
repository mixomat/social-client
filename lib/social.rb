require "rubygems"
require "rest_client"
require "json"
require "faker"

ROOT = File.expand_path(File.dirname(__FILE__))

module Social
  class Base
    attr_accessor :base_url
    
    def initialize(base_url)
      @base_url = base_url
    end
    
    def rand_user
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      user_id = "#{first_name.downcase.slice(0,1)}#{last_name.downcase}"
      name = "#{first_name} #{last_name}"
      
      {:name => name, :user_id => user_id}
    end
    
    def parse_resp(resp)
      JSON.parse(resp.to_s, {:symbolize_names => true })
    end
    
    def get_json(path, params)
      RestClient.get path, {:accept => :json, :params => params}
    end
    
  end
end

require "#{ROOT}/social/comment"
require "#{ROOT}/social/like"