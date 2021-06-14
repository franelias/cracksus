module V1
  module ExceptionHandlers
    extend ActiveSupport::Concern

    included do
      rescue_from Grape::Exceptions::ValidationErrors do |e|
        error!({ errors: ["#{e.message.split.last}.#{e.message.split.first}"] }, 400)
      end

      rescue_from Grape::Exceptions::MethodNotAllowed do |_e|
        error!({ errors: ['server.method_not_allowed'] }, 405)
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        error!({ errors: ["#{e.message.split.third.downcase}.not_found"] }, 404)
      end

      rescue_from CrackwatchApi::Users::Error do |e|
        error!({ errors: [e.message.to_s] }, 400)
      end

      rescue_from :all do |e|
        Rails.logger.error "\n#{e.class.name} (#{e.message}):"
        e.backtrace.each { |line| Rails.logger.error line }
        error!({ errors: ['server.internal_error'] }, 500)
      end
    end
  end
end
