import { render, screen } from '@testing-library/react';
import MenuList from './MenuList';

describe('MenuList Component', () => {
  const MOCK_MENUS = [
    { id: 1, name: 'Pizza A', price: 10.99 },
    { id: 2, name: 'Pizza B', price: 15.99 },
    { id: 3, name: 'Pizza C', price: 8.99 },
  ];

  it('renders all items correctly', () => {
    render(<MenuList menus={MOCK_MENUS} />);

    const menuItems = screen.getByRole('list');
    expect(menuItems).toHaveClass('menu-list');

    MOCK_MENUS.forEach((menu) => {
      const menuItemName = screen.getByText(menu.name);
      const menuItemPrice = screen.getByText(`$${menu.price.toFixed(2)}`);

      expect(menuItemName).toBeInTheDocument();
      expect(menuItemPrice).toBeInTheDocument();
    });
  });
});
