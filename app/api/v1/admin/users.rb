module V1
    module Admin
      class Users < Grape::API

        desc 'Retrives all users.'
        get do
          User.all
        end

        desc 'Retrives a user.'
        params do 
        end
        
        get '/:uid' do 
          User.find(params[:uid])
        end
        
      end
    end
end
  