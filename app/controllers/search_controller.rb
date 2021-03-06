class SearchController < ApplicationController
  def index
    zip = params[:q]
    @conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["nrel_gov_key"]
      faraday.adapter Faraday.default_adapter
    end
    response = @conn.get("/api/alt-fuel-stations/v1/nearest.json?location=#{zip}&fuel_type=ELEC,LPG")

    results = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]

    @stations = results.take(10).map do |result|
      Station.new(result)
    end
  end
end