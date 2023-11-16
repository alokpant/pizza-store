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
    <li>
      <strong>{menu.name}</strong> - ${menu.price}
    </li>
  );
}

export default MenuItem;
