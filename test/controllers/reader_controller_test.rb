# frozen_string_literal: true

require 'test_helper'

class ReaderControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get reader_show_url
    assert_response :success
  end
end
