require 'rails_helper'


describe 'User can CRUD locations' do

  scenario 'User can create a Location' do
    visit '/'
    click_on "New Location"
    fill_in 'location[name]', :with => "Finn"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"
    click_on "Create Location"
    expect(page).to have_content("Finn")
    expect(page).to have_content("Location was successfully created")
  end

  scenario 'User can view a show page for a location' do
    Location.create(name: "Finn", address: "New Address", zipcode: "90210")
    visit '/'
    click_on 'Finn'
    expect(page).to have_content("90210")
  end

  scenario 'User can edit a location' do
    Location.create(name: "Finn", address: "New Address", zipcode: "90210")
    visit '/'
    click_on "Edit"
    fill_in 'location[name]', :with => "changed"
    click_on "Update Location"
    expect(page).to have_content("Location was successfully updated")
    expect(page).to have_content("changed")
  end

  scenario 'User can delete a location' do
    Location.create(name: "Finn", address: "New Address", zipcode: "90210")
    visit '/'
    click_on "Delete"
    expect(page).to have_content("Location was successfully destroyed")
    expect(page).to have_no_content("Finn")
  end






end
