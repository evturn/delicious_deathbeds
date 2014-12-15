class BeersController < ApplicationController

  def index

    trend_url = "http://api.untappd.com/v4/beer/trending?client_id=#{ENV['UNTAPPD_ID']}&client_secret=#{ENV['UNTAPPD_SECRET']}" 
    trending    = HTTParty.get( trend_url )
    featured    = trending['response']["micro"]["items"].sample
    @f_beer     = featured['beer']
    @f_brewery  = featured['brewery']
    render :json @f_beer.to_json
    render :json @f_brewery.to_json

    
    
  
    

    @f_beer     = featured['beer']['beer_name']
    @f_label    = featured['beer']['beer_label']
    @f_abv      = featured['beer']['beer_abv']
    @f_brewery  = featured['brewery']['brewery_name']
    city        = featured['brewery']['location']['brewery_city']
    state       = featured['brewery']['location']['brewery_state']
    country     = featured['brewery']['country_name']
    @f_location = "#{city}, #{state} #{country}"

    @top_beers = trending['response']["micro"]["items"].map { |item| 
        item }
        

    
  end

  def search

    query = params['query'].gsub(' ', '+')
    url = "https://api.untappd.com/v4/search/beer?client_id=#{ENV['UNTAPPD_ID']}&client_secret=#{ENV['UNTAPPD_SECRET']}&q=#{query}"
    response     = HTTParty.get( url )
    beer         = response['response']['beers']['items'].first['beer']
    render json: beer.to_json, status: 200
  end

end