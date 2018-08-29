class SearchController < ApplicationController
  def index
    zip = params[:zip]
    @conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.headers["X-API-KEY"] = "9QJhTjDEGmGnzvFWWEF4jfeMXC57X9c6K6l3gcvu"
      faraday.adapter Faraday.default_adapter
    end

require 'pry'; binding.pry

    response = @conn.get("/api/alt-fuel-stations/v1/nearest.json?zip=#{zip}")

    @stations = JSON.parse(response.body, symbolize_names: true)[:results]
  end
end