module V1
  module Users
    class Mount < Grape::API
      mount Users::Register => '/register'
      
      helpers Helpers::ApiHelpers
      helpers Helpers::LoginHelpers
      use CrackwatchApi::Middleware::UsersMiddleware
      before { authenticate! }
      mount Users::Me
    end
  end
end
