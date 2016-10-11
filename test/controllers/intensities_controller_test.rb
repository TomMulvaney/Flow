require 'test_helper'

class IntensitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intensity = intensities(:one)
  end

  test "should get index" do
    get intensities_url
    assert_response :success
  end

  test "should get new" do
    get new_intensity_url
    assert_response :success
  end

  test "should create intensity" do
    assert_difference('Intensity.count') do
      post intensities_url, params: { intensity: { level: @intensity.level, name: @intensity.name } }
    end

    assert_redirected_to intensity_url(Intensity.last)
  end

  test "should show intensity" do
    get intensity_url(@intensity)
    assert_response :success
  end

  test "should get edit" do
    get edit_intensity_url(@intensity)
    assert_response :success
  end

  test "should update intensity" do
    patch intensity_url(@intensity), params: { intensity: { level: @intensity.level, name: @intensity.name } }
    assert_redirected_to intensity_url(@intensity)
  end

  test "should destroy intensity" do
    assert_difference('Intensity.count', -1) do
      delete intensity_url(@intensity)
    end

    assert_redirected_to intensities_url
  end
end
