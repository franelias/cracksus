module Api
  class Mount < Grape::API
    format         :json
    content_type   :json, 'application/json'
    default_format :json
    
    mount V1::Mount
  end
end
