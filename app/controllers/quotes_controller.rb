class QuotesController < ApplicationController

  def index
  name = params[:name]
  binding.pry
  @quotes = Quote.search(name)
  json_response(@quotes)
end

  def show
    @quote = Quote.find(params[:id])
    json_response(@quote)
  end

  def create
    @quote = Quote.create!(quote_params)
    json_response(@quote)
  end

  def update
    if @quote.update!(quote_params)
      render status: 200, json: {
       message: "Your quote has been updated successfully."
       }
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
  end

  private
  def quote_params
    params.permit(:author, :content)
  end
end
