require "test_helper"

class CampSitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @camp_site = camp_sites(:one)
  end

  test "should get index" do
    get camp_sites_url
    assert_response :success
  end

  test "should get new" do
    get new_camp_site_url
    assert_response :success
  end

  test "should create camp_site" do
    assert_difference("CampSite.count") do
      post camp_sites_url, params: { camp_site: { address: @camp_site.address, detail: @camp_site.detail, name: @camp_site.name, url: @camp_site.url } }
    end

    assert_redirected_to camp_site_url(CampSite.last)
  end

  test "should show camp_site" do
    get camp_site_url(@camp_site)
    assert_response :success
  end

  test "should get edit" do
    get edit_camp_site_url(@camp_site)
    assert_response :success
  end

  test "should update camp_site" do
    patch camp_site_url(@camp_site), params: { camp_site: { address: @camp_site.address, detail: @camp_site.detail, name: @camp_site.name, url: @camp_site.url } }
    assert_redirected_to camp_site_url(@camp_site)
  end

  test "should destroy camp_site" do
    assert_difference("CampSite.count", -1) do
      delete camp_site_url(@camp_site)
    end

    assert_redirected_to camp_sites_url
  end
end
