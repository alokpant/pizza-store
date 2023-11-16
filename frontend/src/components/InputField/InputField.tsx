import React from 'react';

interface InputFieldProps {
  handleSearchChange: React.ChangeEventHandler<HTMLInputElement>
  search?: string
}

const InputField: React.FC<InputFieldProps> = ({ handleSearchChange, search }) => {
  return (
    <div>
      <label htmlFor="search">Search:</label>
      <input
        type="text"
        id="search"
        value={search ?? ''}
        onChange={handleSearchChange}
      />
    </div>
  );
}

export default InputField;



