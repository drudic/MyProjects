class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  # all parameters travel in the controller chain; will be sliced on demand
  ActionController::Parameters.permit_all_parameters = true

  # HTTP Basic Authentication
  http_basic_authenticate_with name: "sa", password: "sa"

  private

  # TODO Rendering outside of controllers
  def render_success(message, data)
    render json: {
        status: 'SUCCESS',
        message: message,
        data: data
    }, status: :ok
  end

  # TODO Rendering outside of controllers
  def render_failure(message, data)
    render json: {
        status: 'ERROR',
        message: message,
        data: data
    }, status: :ok
  end
end
