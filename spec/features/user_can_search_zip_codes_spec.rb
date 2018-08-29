require 'rails_helper'

describe "A user" do
  context "visits the root path" do
    it "enters zip code into a form and gets results" do
      visit "/"

      fill_in :q, with: "80203"

      click_on "Locate"

      expect(current_path).to eq(search_path)
      expect(page).to have_content("10 Results")
      expect(page).to have_css(".station", count: 10)

      within (first(".station")) do
        expect(page).to have_css(".name")
        expect(page).to have_css(".address")
        expect(page).to have_css(".fuel_type")
        expect(page).to have_css(".distance")
        expect(page).to have_css(".access_times")
      end
    end
  end
end



=begin

As a user
When I visit "/"
And I fill in the search form with 80203 (Note: Use the existing search form)
And I click "Locate"
Then I should be on page "/search"
Then I should see a list of the 10 closest stations within 6 miles sorted by distance
And the stations should be limited to Electric and Propane
And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

=end