require "test_helper"

class MenusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menu = menus(:one)
  end

  test "should get index" do
    get menus_url, as: :json
    assert_response :success

    menus = JSON.parse(response.body)
    assert_equal Menu.count, menus.size
  end

  test "should show menu" do
    get menu_url(@menu), as: :json
    assert_response :success

    menu_response = JSON.parse(response.body)
    assert_equal @menu.name, menu_response['name']
    assert_equal @menu.price, menu_response['price']
  end

  test 'should return 404 when id is invalid' do
    non_existent_menu_id = -1

    get menu_url(non_existent_menu_id), as: :json
    assert_response :not_found

    error_response = JSON.parse(response.body)
    assert_equal 'Not Found', error_response['error']
  end
end
