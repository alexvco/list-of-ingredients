include ActionController::HttpAuthentication::Token::ControllerMethods

module Authenticate
  def current_customer
    authenticate_or_request_with_http_token do |token, options|
      @current_customer = Customer.find_by(access_token: token)
    end
  end

  def authenticate_with_token!
    render json: { error: "HTTP Token: Access denied."}, status: :unauthorized unless current_customer.present?
  end
end

# Token token=AduG_tZjZWbh1FDG_bh9
