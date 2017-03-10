require 'twilio-ruby'

module ApplicationHelper
  def generate_twilio_token
    # Create an Access Token for Video usage
      token = Twilio::Util::AccessToken.new ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_API_KEY'], ENV['TWILIO_API_SECRET'], 3600, "#{current_user.id}-#{(current_user == @livestream.user)}"

      # Grant access to Video
      grant = Twilio::Util::AccessToken::VideoGrant.new
      grant.configuration_profile_sid = ENV['TWILIO_CONFIGURATION_SID']
      token.add_grant grant

      # Generate the token and send to client
      token.to_jwt
  end
end
