module V1
  module Public
    class Games < Grape::API
      desc 'Retrieves all games.'
      params do 
      end

      get do 
        Game.all
      end
    end
  end
end
