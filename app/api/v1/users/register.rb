module V1
  module Users
    class Register < Grape::API
      desc 'Posts a new user.'
      params do
        requires :username, type: String
        requires :password, type: String
        requires :mail, type: String
      end

      post do
        declared_params = declared(params)

        created_user = User.create!(declared_params)

        present created_user, with: V1::Users::Entities::LoggedUser
        status 201

      rescue ActiveRecord::RecordInvalid => e
        error!({ errors: ["users.register.#{e.message.split.third.downcase}_taken"] }, 400)
      end
    end
  end
end
