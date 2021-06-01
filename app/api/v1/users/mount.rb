module V1
    module Users
      class Mount < Grape::API
  
        mount Users::Register => '/register'
        mount Users::Login => '/login'
      end
    end
  end