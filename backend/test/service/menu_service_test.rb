# test/services/menu_service_test.rb

require 'test_helper'

class MenuServiceTest < ActiveSupport::TestCase
  test 'execute should return all menus without filtering and sorting' do
    service = MenuService.new
    result = service.execute({})
    assert_equal [12.99, 15.99, 10.99], result.pluck(:price)
  end

  test 'execute should filter by name' do
    service = MenuService.new
    result = service.execute(name: 'sup')
    assert_equal [10.99], result.pluck(:price)
  end

  test 'execute should sort by name in ascending order' do
    service = MenuService.new
    result = service.execute(sort_by: :price, order_by: :desc)
    assert_equal [15.99, 12.99, 10.99], result.pluck(:price)
  end

  test 'execute should raise ArgumentError when invalid field is passed' do
    assert_raises ArgumentError do
      MenuService.new.execute(sort_by: :invalid_field)
    end
  end
end
