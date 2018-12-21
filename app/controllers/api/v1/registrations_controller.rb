class Api::V1::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token

  def create
    build_resource(customer_params)

    resource.save
    if resource.save && resource.errors.empty?
      render json: resource, status: :created
    else
      render json: {errors: resource.errors}, status: :bad_request
    end
  end

  private

   def customer_params
     params.require(:registration).permit(:email, :password)
   end
end