class SearchController < ApplicationController
  def index
    zip = params[:q]
    @conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.headers["X-API-KEY"] = "9QJhTjDEGmGnzvFWWEF4jfeMXC57X9c6K6l3gcvu"
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/api/alt-fuel-stations/v1/nearest.json?location=#{zip}")

    results = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
    
    @stations = results.map do |result|
      Station.new(result)
    end
  end
end