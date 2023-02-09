class AuthorizationService
  def initialize(headers = {})
    @headers = headers
  end

  def authenticate_request!
    verify_token
  end

  def current_user
    @auth_payload, @auth_header = verify_token
    @user = User.from_token_payload(@auth_payload)
  end

  private

  # def http_token
  #   if @headers['Authorization'].present?
  #     @headers['Authorization'].split(' ').last
  #   end
  # end

  def verify_token
    JsonWebToken.verify(@headers)
  end
end