require "test_helper"

class MenuTest < ActiveSupport::TestCase
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
end
