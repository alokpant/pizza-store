require "test_helper"

class MenusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menu = menus(:supreme)
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

    get menu_url(id: non_existent_menu_id), as: :json
    assert_response :not_found

    error_response = JSON.parse(response.body)
    assert_equal "Couldn't find Menu with 'id'=-1", error_response['error']
  end

  test "should return all results when search is empty" do
    get menus_url(search: ' '), as: :json
    assert_response :success

    menus = JSON.parse(response.body)
    assert_equal Menu.all.size, menus.size
  end

  test "should return empty result when search is invalid" do
    get menus_url(search: 'non_existing_keyword'), as: :json
    assert_response :success

    menus = JSON.parse(response.body)
    assert_equal 0, menus.size
  end

  test 'should return 422 when order_by is invalid' do
    order_by = 1

    get menus_url(order_by:), as: :json
    assert_response :unprocessable_entity

    error_response = JSON.parse(response.body)
    assert_equal 'Invalid field for ordering: 1', error_response['error']
  end

  test 'should return 422 when sort_by is invalid' do
    sort_by = 'invalid_field'

    get menus_url(sort_by:), as: :json
    assert_response :unprocessable_entity

    error_response = JSON.parse(response.body)
    assert_equal "Invalid field for ordering: #{sort_by}", error_response['error']
  end
end
