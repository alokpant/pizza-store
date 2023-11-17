import { render, screen } from '@testing-library/react';
import MenuItem from './MenuItem';

describe('MenuItem', () => {
  const MOCK_MENU = {
    id: 1,
    name: 'Pizza A',
    price: 10.99,
  };

  it('renders item correctly', () => {
    render(<MenuItem menu={MOCK_MENU} />);
    const itemNameElement = screen.getByText(MOCK_MENU.name);
    const itemPriceElement = screen.getByText(`$${MOCK_MENU.price.toFixed(2)}`);

    expect(itemNameElement).toBeInTheDocument();
    expect(itemPriceElement).toBeInTheDocument();
  });

  it('applies correct css classes', () => {
    render(<MenuItem menu={MOCK_MENU} />);

    const menuElement = screen.getByRole('listitem');
    expect(menuElement).toHaveClass('menu-item');

    const menuItemName = screen.getByText('Pizza A');
    expect(menuItemName.classList.contains('menu-item__name')).toBeTruthy();

    const menuItemPrice = screen.getByText('$10.99');
    expect(menuItemPrice.classList.contains('menu-item__price')).toBeTruthy();
  })

  it('renders price correct when only one decimal number is present', () => {
    render(<MenuItem menu={{
      ...MOCK_MENU,
      price: 10.9
    }} />);
    const itemNameElement = screen.getByText(MOCK_MENU.name);
    const itemPriceElement = screen.getByText(`$10.90`);

    expect(itemNameElement).toBeInTheDocument();
    expect(itemPriceElement).toBeInTheDocument();
  })
})