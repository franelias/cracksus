module V1
    module Users
        module Entities
            class LoggedUser <Grape::Entity
                expose :username
                expose :mail
                expose :status
                expose :role
            end
        end
    end 
end