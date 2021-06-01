module V1
    module Users
      class Login < Grape::API
        desc 'Searches for user and authenticates login.'
        params do 
            requires :username, type: String
            requires :password, type: String
        end

        post do
            user = User.find_by(username: params[:username])
            return error!({ errors: ['admin.users.not_found'] }, 404) if user.nil?

            if user.authenticate(params[:password])
              return user
            else
              return error!({ errors: ['admin.users.wrong_password'] }, 404)
            end
        end
      end
    end
  end