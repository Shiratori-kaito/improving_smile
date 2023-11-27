# frozen_string_literal: true

require 'test_helper'

class PhotosControllerTest < ActionDispatch::IntegrationTest
  test 'should get capture' do
    get photos_capture_url
    assert_response :success
  end
end
