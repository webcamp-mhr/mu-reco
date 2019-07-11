require 'test_helper'

class SongsTitlesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get songs_titles_new_url
    assert_response :success
  end

end
