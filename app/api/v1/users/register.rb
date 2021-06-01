module V1
    module Users
      class Register < Grape::API
        desc 'Posts a new user.'
        params do 
            requires :username, type: String
            requires :password, type: String
            requires :mail, type: String
            requires :status, type: String
            requires :role, type: String
        end
  
        post do
            User.create!(params)
            status 201
        end
      end
    end
  end