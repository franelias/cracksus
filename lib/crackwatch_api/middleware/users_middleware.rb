# frozen_string_literal: true

module CrackwatchApi
  module Middleware
    class UsersMiddleware < Grape::Middleware::Base
      include V1::Helpers::LoginHelpers
      def before
        @session = request.session
        @user = User.find_by_id(@session[:uid])
        env[:current_payload] = authenticate_session! unless @user.nil?
      end

      def update_session!
        # key = key_name(@user.id, @session.id)
        # value = encrypted_session(@session.id)
        expire_time = Time.now.to_i + CrackwatchApi::App.session_expire_time
        @session[:expire_time] = expire_time
        # Rails.cache.write(key, value, expires_in: expire_time)
      end

      def authenticate_session!
        unless @request.env['HTTP_USER_AGENT'] == @session[:user_agent] &&
               Time.now.to_i < @session[:expire_time]

          # key = key_name(@user.id, @session.id)
          # Rails.cache.delete(key)

          @session.destroy

          raise(CrackwatchApi::Error, 'authz.client_session_mismatch')
        end

        raise(CrackwatchApi::Error, 'admin.users.pending') if @user.status == 'pending'
        raise(CrackwatchApi::Error, 'admin.users.banned') if @user.status == 'banned'

        update_session!

        @user
      end

      def request
        @request ||= Grape::Request.new(env)
      end
    end
  end
end
