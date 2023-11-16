import React from 'react';
import MenuItem, { Menu } from '../MenuItem/MenuItem';

interface MenuListProps {
  menus: Menu[]
}

const MenuList: React.FC<MenuListProps> = ({ menus }) => {
  return (
    <ul className="menu-item">
      {menus.map(menu => (
        <MenuItem key={menu.id} menu={menu} />
      ))}
    </ul>
  );
}

export default MenuList;
