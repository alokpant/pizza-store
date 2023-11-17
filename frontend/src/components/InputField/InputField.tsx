import React from 'react';
interface InputFieldProps {
  callBack: (value: string) => void
  search?: string
}

const InputField: React.FC<InputFieldProps> = ({ callBack, search }) => {
  const handleChange = (event: React.ChangeEvent<HTMLInputElement>): void => {
    callBack(event.target.value)
  };

  return (
    <div className="input">
      <input
        type="text"
        className="input__field"
        value={search ?? ''}
        onChange={handleChange}
        required
      />
      <label className="input__label">Search</label>
    </div>
  );
}

export default InputField;
