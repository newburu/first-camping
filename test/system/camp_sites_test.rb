require "application_system_test_case"

class CampSitesTest < ApplicationSystemTestCase
  setup do
    @camp_site = camp_sites(:one)
  end

  test "visiting the index" do
    visit camp_sites_url
    assert_selector "h1", text: "Camp sites"
  end

  test "should create camp site" do
    visit camp_sites_url
    click_on "New camp site"

    fill_in "Address", with: @camp_site.address
    fill_in "Detail", with: @camp_site.detail
    fill_in "Name", with: @camp_site.name
    fill_in "Website Url", with: @camp_site.website_url
    click_on "Create Camp site"

    assert_text "Camp site was successfully created"
    click_on "Back"
  end

  test "should update Camp site" do
    visit camp_site_url(@camp_site)
    click_on "Edit this camp site", match: :first

    fill_in "Address", with: @camp_site.address
    fill_in "Detail", with: @camp_site.detail
    fill_in "Name", with: @camp_site.name
    fill_in "Website Url", with: @camp_site.website_url
    click_on "Update Camp site"

    assert_text "Camp site was successfully updated"
    click_on "Back"
  end

  test "should destroy Camp site" do
    visit camp_site_url(@camp_site)
    click_on "Destroy this camp site", match: :first

    assert_text "Camp site was successfully destroyed"
  end
end
