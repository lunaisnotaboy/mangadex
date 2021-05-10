# frozen_string_literal: true

require 'test_helper'

class MangaControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get manga_show_url
    assert_response :success
  end
end
