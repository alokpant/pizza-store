import React from 'react';

interface InputFieldProps {
  handleSearchChange: React.ChangeEventHandler<HTMLInputElement>
  search?: string
}

const InputField: React.FC<InputFieldProps> = ({ handleSearchChange, search }) => {
  return (
    <div className="input">
      <input
        type="text"
        className="input__field"
        value={search ?? ''}
        onChange={handleSearchChange}
        required
      />
      <label className="input__label">Search</label>
    </div>
  );
}

export default InputField;