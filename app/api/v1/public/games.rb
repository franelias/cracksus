module V1
  module Public
    class Games < Grape::API
      desc 'Retrieves all the games in the db.'
      get do
        present Game.all, with: V1::Public::Entities::Game
      end

      desc 'Retrieves all unreleased games.'
      get '/unreleased' do
        present Game.unreleased, with: V1::Public::Entities::Game
      end

      desc 'Retrieves all uncracked games.'
      get '/uncracked' do
        present Game.uncracked, with: V1::Public::Entities::Game
      end
    end
  end
end
