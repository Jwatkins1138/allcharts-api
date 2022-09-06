class TickersController < ApplicationController
  def index
    tickers = Ticker.where("name LIKE ?", "%#{params[:search]}%").limit(5)
    puts params[:search]
    render json: tickers
  end
end
