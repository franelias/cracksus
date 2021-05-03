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
            optional :release_date, type: DateTime
            optional :crack_date, type: DateTime
        end
  
        post do 
            Game.create!({
                name:params[:name],
                status: params[:status],
                anti_tamper: params[:anti_tamper],
                image_url: params[:image_url],
                store_url: params[:store_url],
                cracked_by: params[:cracked_by],
                release_date: params[:release_date],
                crack_date: params[:crack_date]
            })
        end
      end
    end
  end