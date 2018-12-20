module Authenticate
  def current_customer
    @current_customer = Customer.find_by(access_token: params[:access_token])
  end

  def authenticate_with_token!
    render json: { error: "Not Authenticated"}, status: :unauthorized unless current_customer.present?
  end
end