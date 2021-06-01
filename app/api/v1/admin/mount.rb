module V1
    module Admin
      class Mount < Grape::API
  
        mount Admin::Games => '/games'
        mount Admin::Users => '/users'
      end
    end
end