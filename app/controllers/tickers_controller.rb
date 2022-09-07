class TickersController < ApplicationController
  def index
    tickers = Ticker.where("name LIKE ?", "#{params[:search]}%").limit(5)
    render json: tickers
  end

  def page_index
    start = params[:page].to_i * 50
    finish = start + 50
    tickers = Ticker.where("id > ? AND id < ?", start, finish)
    render json: tickers
  end
end
