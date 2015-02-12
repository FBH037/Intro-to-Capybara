require "rails_helper"

describe "User can CRUD event" do

  before :each do
    @location = Location.create(name: "Fancy place")
  end

  scenario 'User can create an event' do
    visit "/locations/#{@location.id}"
    click_on "New Event"
    fill_in "event[description]", with: "party"
    fill_in "event[date]", with: "11/24/2015"
    check("event[requires_id]")
    click_on "Create Event"
    expect(page).to have_content("party")
    expect(page).to have_content("Event was successfully created")
  end

  scenario 'User can visit show page for an event' do
    Event.create(description: "party", date:'11/11/2015' , requires_id: true, location_id: @location.id )
    visit "/locations/#{@location.id}"
    click_on "party"
    expect(page).to have_content("2015-11-11")
  end


  scenario 'User can update an event' do
    Event.create(description: "party", date:'11/11/2015' , requires_id: true, location_id: @location.id )
    visit "/locations/#{@location.id}"
    click_on "Edit"
    fill_in "event[description]", with: "not so party"
    click_on "Update Event"
    expect(page).to have_content("Event was successfully updated")
    expect(page).to have_content("not so party")
  end

  scenario 'User can delete an event' do
    Event.create(description: "party", date:'11/11/2015' , requires_id: true, location_id: @location.id )
    visit "/locations/#{@location.id}"
    click_on "Delete"
    expect(page).to have_content("Event was successfully destroyed")
    expect(page).to have_no_content("party")
  end
end
