class TickersController < ApplicationController
  def index
    tickers = Ticker.where("name = ?", "%#{params[:search]}%").limit(5)
    render json: tickers
  end
end
