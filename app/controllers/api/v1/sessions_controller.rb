class Api::V1::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token
  skip_before_action :verify_signed_out_user, only: :destroy

  def create
    customer = Customer.find_by(email: params[:session][:email])
    if customer&.valid_password?(params[:session][:password])
      customer.last_sign_in_at = customer.current_sign_in_at
      customer.current_sign_in_at = Time.now
      customer.last_sign_in_ip = customer.current_sign_in_ip
      customer.current_sign_in_ip = request.remote_ip 

      customer.generate_authentication_token
      customer.save

      render json: customer.to_json(only: [:email, :access_token]), status: 200
    else
      render json: {error: "Not a valid email/password"}, status: 401
    end
  end

  def destroy
    customer = Customer.find_by(access_token: params[:access_token])
    if customer.present?
      customer.access_token = nil
      customer.save
      head :no_content
    else
      render json: {error: "You have already signed out"}, status: 422
    end
  end

end