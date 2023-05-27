require "test_helper"

class CampLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @camp_log = camp_logs(:one)
  end

  test "should get index" do
    get camp_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_camp_log_url
    assert_response :success
  end

  test "should create camp_log" do
    assert_difference("CampLog.count") do
      post camp_logs_url, params: { camp_log: { camp_site_id: @camp_log.camp_site_id, detail: @camp_log.detail, end_day: @camp_log.end_day, images: @camp_log.images, start_day: @camp_log.start_day, user_id: @camp_log.user_id } }
    end

    assert_redirected_to camp_log_url(CampLog.last)
  end

  test "should show camp_log" do
    get camp_log_url(@camp_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_camp_log_url(@camp_log)
    assert_response :success
  end

  test "should update camp_log" do
    patch camp_log_url(@camp_log), params: { camp_log: { camp_site_id: @camp_log.camp_site_id, detail: @camp_log.detail, end_day: @camp_log.end_day, images: @camp_log.images, start_day: @camp_log.start_day, user_id: @camp_log.user_id } }
    assert_redirected_to camp_log_url(@camp_log)
  end

  test "should destroy camp_log" do
    assert_difference("CampLog.count", -1) do
      delete camp_log_url(@camp_log)
    end

    assert_redirected_to camp_logs_url
  end
end
