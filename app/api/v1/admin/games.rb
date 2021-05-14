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

      desc 'Updates a game.'
      params do
        requires :id, type: Integer
        optional :name, type: String
        optional :status, type: String
        optional :anti_tamper, type: String
        optional :image_url, type: String
        optional :store_url, type: String
        optional :cracked_by, type: String
        optional :release_date, type: Date
        optional :crack_date, type: Date
      end

      put do
        game = Game.find(params[:id])
        return error!({ errors: ['admin.games.not_found'] }, 404) if game.nil?

        Game.update(params)
        status 200
      end

      desc 'Deletes a game.'
      params do
        requires :id, type: Integer
      end

      delete do
        game = Game.find(params[:id])
        return error!({ errors: ['admin.games.not_found'] }, 404) if game.nil?

        game.destroy
        status 200
      end

      desc 'Retrieves all games.'
      get do
        Game.all
      end
    end
  end
end
