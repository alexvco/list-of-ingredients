class Api::V1::DrinksController < ApiController
  before_action :authenticate_with_token!, only: [:index]
  
  def index
    puts params
    puts "#"*200
    puts request.headers['Authorization']
    token = request.headers['Authorization'].gsub(/^Bearer /, '')
    puts "token"*100
    puts token
    @drinks = Drink.all
    render json: @drinks.to_json
  end

  # GET /drinks/:id
  def show
    @drink = Drink.find(params[:id])
    render json: @drink.to_json(:include => { :ingredients => { :only => [:id, :description] }})
  end
end