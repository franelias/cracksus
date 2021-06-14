module V1
  module Sessions
    class Identity < Grape::API
      desc 'Searches for user and authenticates login.'
      params do
        requires :username, type: String
        requires :password, type: String
      end

      post '/login' do
        declared_params = declared(params)
        user = User.find_by(username: declared_params[:username])
        return error!({ errors: ['admin.users.not_found'] }, 404) if user.nil?
        return error!({ errors: ['admin.users.pending'] }, 401) if user.status == 'pending'
        return error!({ errors: ['admin.users.banned'] }, 401) if user.status == 'banned'

        unless user.authenticate(declared_params[:password])
          return error!({ errors: ['admin.users.wrong_password'] }, 404)
        end

        expire_time = Time.now.to_i + CrackwatchApi::App.session_expire_time
        session = request.session
        session.merge!(
          'uid': user.id,
          'status': user.status,
          'role': user.role,
          'expire_time': expire_time,
          "user_agent": request.env['HTTP_USER_AGENT']
        )
        # key = key_name(user.id, session.id)

        # Rails.cache.fetch(key, expires_in: expire_time) { encrypted_session(session.id) }
        present user, with: V1::Users::Entities::LoggedUser
        return status 200
      end

      desc 'Logout active user.'
      delete '/logout' do
        user = User.find(request.session[:uid])
        return error!({ errors: ['admin.users.not_found'] }, 404) if user.nil?

        # key = key_name(user.id, request.session.id)

        # Rails.cache.delete(key)
        request.session.destroy
        status 200
      end
    end
  end
end
