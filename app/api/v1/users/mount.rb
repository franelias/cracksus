module V1
  module Users
    class Mount < Grape::API
      helpers Helpers::ApiHelpers
      helpers Helpers::LoginHelpers
      use CrackwatchApi::Middleware::UsersMiddleware

      mount Users::Register => '/register'
      mount Users::Me
    end
  end
end
