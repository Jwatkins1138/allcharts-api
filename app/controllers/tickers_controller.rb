class TickersController < ApplicationController
  def index
    tickers = Ticker.where("name LIKE ?", "#{params[:search]}%").limit(5)
    render json: tickers
  end

  def page_index
    if params[:letter]
      tickers = []
      start = params[:page].to_i * 50
      finish = start + 50
      Ticker.where("name LIKE ?", "#{params[:letter]}%").find_each.with_index do |entry, index|
        if index >= start && index < finish
          tickers.push(entry)
        end
      end
    else
      start = params[:page].to_i * 50
      finish = start + 50
      tickers = Ticker.where("id > ? AND id < ?", start, finish)
    end
    render json: tickers
  end
end
