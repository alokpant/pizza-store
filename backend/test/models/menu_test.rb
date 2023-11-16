require "test_helper"

class MenuTest < ActiveSupport::TestCase
  # Validations - start
  test 'name should be present' do
    menu = Menu.new(price: 10.99)
    assert_not menu.save, 'Saved menu without a name'
  end

  test 'name should be unique case-insensitive' do
    existing_menu = Menu.create(name: 'Existing Menu', price: 15.99)
    menu = Menu.new(name: 'existing menu', price: 20.99)
    assert_not menu.save, 'Saved menu with a non-unique name'
  end

  test 'name should have a minimum length of 3 characters' do
    menu = Menu.new(name: 'ab', price: 12.99)
    assert_not menu.save, 'Saved menu with a name less than 3 characters'
  end

  test 'name should have a maximum length of 20 characters' do
    menu = Menu.new(name: 'a' * 21, price: 8.99)
    assert_not menu.save, 'Saved menu with a name longer than 20 characters'
  end

  test 'price should be present' do
    menu = Menu.new(name: 'New Menu')
    assert_not menu.save, 'Saved menu without a price'
  end

  test 'price should be greater than or equal to 0' do
    menu = Menu.new(name: 'New Menu', price: -5.99)
    assert_not menu.save, 'Saved menu with a negative price'
  end
  # Validations - end

  # Scopes - start
  test 'ordered_by should return data should order correctly by name' do
    menus = Menu.ordered_by('name')
    assert_equal ['Buffalo Ranch Chicken', 'Pesto Chicken', 'Supreme'], menus.pluck(:name)
  end

  test 'ordered_by should return data should order by name in descending order when provided' do
    menus = Menu.ordered_by('name', :desc)
    assert_equal ['Supreme', 'Pesto Chicken', 'Buffalo Ranch Chicken'], menus.pluck(:name)
  end

  test 'ordered_by should return data should order correctly by price' do
    menus = Menu.ordered_by('price')
    assert_equal ["Supreme", "Buffalo Ranch Chicken", "Pesto Chicken"], menus.pluck(:name)
  end

  test 'ordered_by should return data should order by price in descending order when provided' do
    menus = Menu.ordered_by('price', :desc)
    assert_equal ['Pesto Chicken', 'Buffalo Ranch Chicken', 'Supreme'], menus.pluck(:name)
  end

  test 'ordered_by should return raise ArgumentError when field is invalid' do
    assert_raises ArgumentError do
      Menu.ordered_by(:invalid_field)
    end
  end

  test 'ordered_by should return order data by asc when invalid order_by is passed' do
    menus = Menu.ordered_by('name', :invalid_order)
    assert_equal ['Buffalo Ranch Chicken', 'Pesto Chicken', 'Supreme'], menus.pluck(:name)

    menus = Menu.ordered_by('price', :invalid_order)
    assert_equal ["Supreme", "Buffalo Ranch Chicken", "Pesto Chicken"], menus.pluck(:name)
  end

  test 'search_by_name should return data correctly when valid name is passed' do
    menus = Menu.search_by_name('supreme')
    assert_equal ['Supreme'], menus.pluck(:name)
  end

  test 'search_by_name should return empty array when invalid name is passed' do
    menus = Menu.search_by_name('name')
    assert_equal [], menus
  end

  test 'search_by_name should return multiple menus when passed' do
    menus = Menu.search_by_name('chicken')
    assert_equal ['Pesto Chicken', 'Buffalo Ranch Chicken'], menus.pluck(:name)
  end
  # Scopes - end
end
