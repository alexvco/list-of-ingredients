class ApiController < ActionController::API
  include Authenticate
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def render_404
    render json: {error: "Not found"}, status: 404
  end
end