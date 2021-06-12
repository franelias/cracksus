module V1
  module Public
    module Entities
      class Game < Grape::Entity
        expose :name
        expose :status
        with_options(expose_nil: false) do
          expose :anti_tamper
          expose :image_url
          expose :store_url
          expose :cracked_by
          expose :release_date
          expose :crack_date
        end
      end
    end
  end
end
