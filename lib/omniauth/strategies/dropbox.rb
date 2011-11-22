require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class Dropbox < OmniAuth::Strategies::OAuth
      option :client_options, {
        :site               => 'https://api.dropbox.com',
        :authorize_url      => 'https://www.dropbox.com/1/oauth/authorize',
        :request_token_url  => 'https://api.dropbox.com/1/oauth/request_token',
        :access_token_url   => 'https://api.dropbox.com/1/oauth/access_token'
      }

      uid { raw_info['uid'] }

      info do
        {
          'uid'   => raw_info['uid'],
          'name'  => raw_info['display_name'],
          'email' => raw_info['email']
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('/1/account/info').body)
      end

    end
  end
end