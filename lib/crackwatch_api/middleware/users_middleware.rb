# frozen_string_literal: true

module CrackwatchApi
  module Middleware
    class UsersMiddleware < Grape::Middleware::Base
      include V1::Helpers::LoginHelpers
      def before
        return if request.path.include? 'register'

        @session = request.session
        @user = User.find(@session[:uid])
        env[:current_payload] = authenticate!(@session)
      end

      def update_session!
        key = key_name(@user.id, @session.id)
        value = encrypted_session(@session.id)
        expire_time = Time.now.to_i + CrackwatchApi::Application.config.session_expire_time
        Rails.cache.write(key, value, expires_in: expire_time)
      end

      def authenticate!(_session)
        unless @request.env['HTTP_USER_AGENT'] == @session[:user_agent] &&
               Time.now.to_i < @session[:expire_time]

          key = key_name(@user.id, @session.id)
          Rails.cache.delete(key)

          @session.destroy

          raise(CrackwatchApi::Users::Error, 'authz.client_session_mismatch')
        end

        unless @user.nil?
          raise(CrackwatchApi::Users::Error, 'admin.users.pending') if @user.status == 'pending'
          raise(CrackwatchApi::Users::Error, 'admin.users.banned') if @user.status == 'banned'

          update_session!

          @user
        end
      end

      def request
        @request ||= Grape::Request.new(env)
      end
    end
  end
end
