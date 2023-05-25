require "application_system_test_case"

class CampLogsTest < ApplicationSystemTestCase
  setup do
    @camp_log = camp_logs(:one)
  end

  test "visiting the index" do
    visit camp_logs_url
    assert_selector "h1", text: "Camp logs"
  end

  test "should create camp log" do
    visit camp_logs_url
    click_on "New camp log"

    fill_in "Camp site", with: @camp_log.camp_site_id
    fill_in "Detail", with: @camp_log.detail
    fill_in "End day", with: @camp_log.end_day
    fill_in "Images", with: @camp_log.images
    fill_in "Start day", with: @camp_log.start_day
    fill_in "User", with: @camp_log.user_id
    click_on "Create Camp log"

    assert_text "Camp log was successfully created"
    click_on "Back"
  end

  test "should update Camp log" do
    visit camp_log_url(@camp_log)
    click_on "Edit this camp log", match: :first

    fill_in "Camp site", with: @camp_log.camp_site_id
    fill_in "Detail", with: @camp_log.detail
    fill_in "End day", with: @camp_log.end_day
    fill_in "Images", with: @camp_log.images
    fill_in "Start day", with: @camp_log.start_day
    fill_in "User", with: @camp_log.user_id
    click_on "Update Camp log"

    assert_text "Camp log was successfully updated"
    click_on "Back"
  end

  test "should destroy Camp log" do
    visit camp_log_url(@camp_log)
    click_on "Destroy this camp log", match: :first

    assert_text "Camp log was successfully destroyed"
  end
end
