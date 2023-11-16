import React from 'react';

export interface Menu {
  id: number
  name: string
  price: number
}
interface MenuItemProps {
  menu: Menu
}

const MenuItem: React.FC<MenuItemProps> = ({ menu }) => {
  return (
    <li className="menu-item">
      <div className="menu-item-name">{menu.name}</div>
      <div className="menu-item-price">${Number.parseFloat(String(menu.price)).toFixed(2)}</div>
  </li>
  );
}

export default MenuItem;
