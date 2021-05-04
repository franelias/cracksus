module V1
    module Admin
      class Games < Grape::API

        desc 'Posts a new game.'
        params do 
            requires :name, type: String
            requires :status, type: String
            requires :anti_tamper, type: String
            requires :image_url, type: String
            requires :store_url, type: String
            optional :cracked_by, type: String
            optional :release_date, type: Date
            optional :crack_date, type: Date
        end
  
        post do 
            Game.create!(params)
            status 201
        end
      end
    end
  end