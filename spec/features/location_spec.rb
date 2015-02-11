require 'rails_helper'


describe 'User can CRUD locations' do

  scenario 'User can create a Location' do
    # visit root
    visit '/'

    # click on link to go to new location form
    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "Finn"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_on "Create Location"


    #now we expect the index page to have the name of the location we created.
    expect(page).to have_content("Finn")
    # expecting the flash notification
    expect(page).to have_content("Location was successfully created")
  end

  scenario 'User can view a show page for a location' do

    visit '/'

    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "Finn"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_on "Create Location"


    # visit '/'
    click_on 'Finn'
    expect(page).to have_content("90210")

    #fill in

  end

  scenario 'User can edit a location' do
    visit '/'

    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "Finn"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    click_on "Create Location"

    #submitting form to create a location
    click_on "Edit"

    fill_in 'location[name]', :with => "changed"

    click_on "Update Location"
    expect(page).to have_content("Location was successfully updated")

    expect(page).to have_content("changed")

  end


  scenario 'User can delete a location' do
    visit '/'

    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "Finn"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    click_on "Create Location"

    #submitting form to create a location
    click_on "Delete"

    expect(page).to have_content("Location was successfully destroyed")

    expect(page).to have_no_content("Finn")
  end






end
