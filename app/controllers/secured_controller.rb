class SecuredController < ApplicationController
  before_action :authorize_request

  private

  def authorize_request
    authorize_request = AuthorizationService.new(cookies[:authorization_token])
    @current_user = authorize_request.current_user
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end
end