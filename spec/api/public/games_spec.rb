require 'rails_helper'

RSpec.describe V1::Public::Games, type: :request do
  def do_request
    get '/public/games'
  end

  describe 'GET /games' do
    context 'When the db is empty' do
      it 'retrieves nothing' do
        do_request

        expect(response.body).to eq '[]'
      end
    end

    context 'When theres games in the db' do
      let!(:game1) { FactoryBot.create(:game, :cracked) }
      let!(:game2) { FactoryBot.create(:game, :uncracked) }
      let!(:game3) { FactoryBot.create(:game, :unreleased) }

      it 'retrieves games' do
        do_request

        fields = %w[name status anti_tamper image_url store_url cracked_by].freeze
        games = [game1, game2, game3]
        game_index = 0

        JSON.parse(response.body).each do |game|
          fields.each do |field|
            expect(game[field]).to eq games[game_index][field]
          end
          game_index += 1
        end
      end
    end
  end
end
