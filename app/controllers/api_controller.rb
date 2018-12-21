class ApiController < ActionController::API
  include Authenticate
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def render_404
    render json: {error: "Not found"}, status: 404
  end

# override request_http_token_authentication to not call to set the correct status and headers and then render JSON instead of text
  def request_http_token_authentication(realm = "Application", message = nil)
    self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
    render json: {error: "HTTP Token: Access denied."}, status: :unauthorized
  end
end