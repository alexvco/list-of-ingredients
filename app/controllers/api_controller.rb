class ApiController < ActionController::API
  include Authenticate
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def render_404
    render json: {error: "Not found"}, status: 404
  end

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors
        }
      ]
    }, status: :bad_request
  end
end