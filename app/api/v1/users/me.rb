module V1
  module Users
    class Me < Grape::API
      desc 'Returns current user.'
      get '/me' do
        present current_user, with: V1::Users::Entities::LoggedUser
      end
    end
  end
end
