module V1
    module Admin
      class Mount < Grape::API
  
        mount Admin::Games => '/games'
      end
    end
end